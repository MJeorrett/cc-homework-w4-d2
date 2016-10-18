require('sinatra')
require('sinatra/contrib/all')
require('./db/db_interface')
require('./models/html_builder')

require('pry-byebug')

DBNAME = "shoe_shop"

get '/table-names' do
  names_array = DbInterface.table_names( DBNAME )
  @names_html = HtmlBuilder.ul_from_array( names_array )
  @dbname = DBNAME
  erb(:table_names)
end

get '/table/:table_name' do
  names_array = DbInterface.table_names( DBNAME )
  table_name = params[:table_name]

  if names_array.include?( table_name )

    data = DbInterface.all_records( DBNAME, table_name )
    @html = HtmlBuilder.table_for_data( data )

  else

    @html = "There is no table '#{table_name}' in the '#{DBNAME}' database :-("

  end

  erb(:basic)
end

get '/table/:table_name/new' do

  names_array = DbInterface.table_names( DBNAME )
  table_name = params[:table_name]

  if names_array.include?( table_name )
    fields_data = DbInterface.columns_data( DBNAME, table_name )
    action = "/table/#{table_name}/new"
    @html = HtmlBuilder.form_for_fields( fields_data, action )
  else
    @html = "There is no table '#{table_name}' in the '#{DBNAME}' database :-("
  end

  erb(:basic)
end

post '/table/:table_name/new' do
  table_name = params[:table_name]
  names_array = DbInterface.columns_data( DBNAME, table_name ).map { |data| data[:column] }
  values_array = names_array.map { |name| params[name] }
  DbInterface.create_record( DBNAME, table_name, names_array, values_array )

  redirect to("/table/#{table_name}")
end
