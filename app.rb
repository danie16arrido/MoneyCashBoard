require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/transfers.rb')
require_relative('controllers/categories.rb')


get '/home' do
  @user = User.all.first
  @loans = MasterCategory.find_by_name("Loans")
  @incomes = MasterCategory.find_by_name("Incomes")
  erb(:home)
end

get '/addtransfers' do
  @user = User.all.first
  @mastercategories = MasterCategory.all()
  erb(:addtransfers)
end

get '/addtransfers/:master_category_id' do
  @user = User.all.first
  @mastercategory = MasterCategory.find_by_id(params[:master_category_id])
  erb(:master_category)
end

get '/reports' do
  @user = User.all.first
  @mastercategories = MasterCategory.all()
  erb(:reports)
end

get '/addcategories' do
  @user = User.all.first
  @mastercategories = MasterCategory.all()
  erb(:addcategories)
end
