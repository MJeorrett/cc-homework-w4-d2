require('sinatra')
require('sinatra/contrib/all')

require('pry-byebug')

get '/:table_name' do
  return "I am not yet sure if I the table '#{table_name}' exists in my database"
end
