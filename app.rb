require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/transfers.rb')
require_relative('controllers/categories.rb')


get '/home' do
  @user = User.all.first
  erb(:home)
end
