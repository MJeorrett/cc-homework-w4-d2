require('sinatra')
require('sinatra/contrib/all')
require('./db/db_interface')
require('./models/html_builder')

require('pry-byebug')

DBNAME = "shoe_shop"

get '/table-names' do
  names_array = DbInterface.table_names( DBNAME )
  @names_html = HtmlBuilder.unordered_list_from_array( names_array )
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

    @html = "There is no table '#{table_name}' in the #{DBNAME} database :-("

  end

  erb(:basic)
end
