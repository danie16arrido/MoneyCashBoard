require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/transfers.rb')
require_relative('controllers/categories.rb')


get '/home' do
  @user = User.all.first
  erb(:home)
end

get '/addtranfers' do
  @user = User.all.first
  @mastercategories = MasterCategory.all()
  erb(:addtransfers)
end

get '/addtranfers/:master_category_id' do
  @user = User.all.first
  @mastercategory = MasterCategory.find_by_id(params[:master_category_id])
  erb(:master_category)
end
