require('sinatra')
require('sinatra/contrib/all')
require('./db/db_interface')

require('pry-byebug')

DBNAME = "shoe_shop"

get '/table-names' do
  @html = DbInterface.table_names( DBNAME ).to_s
  erb(:blank)
end

get '/:table_name' do
  @html = "I am not yet sure if I the table '#{params[:table_name]}' exists in my database"
  erb(:blank)
end
