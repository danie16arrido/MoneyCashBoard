require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('../models/mastercategory.rb')
require_relative('../models/category.rb')
require_relative('../models/user.rb')
require_relative('../models/transfer.rb')
require_relative('../models/income.rb')
require_relative('../models/loan.rb')

get '/categories' do
  @user = User.all.first
  # @transfers = @user.list_transfers()
  @all_categories = Category.all()
  @all_master_cat = MasterCategory.all()
  @mastercategories = MasterCategory.all()
  erb(:"categories/index")
end

get '/categories/new/:m_category_id' do
  @user = User.all.first
  @transfers = @user.list_transfers()
  @master_category = MasterCategory.find_by_id(params[:m_category_id])
  erb(:"categories/new")
end

post '/categories' do #create
  @category = Category.new(params)
  @category.save()
  @user = User.all.first
  # @transfers = @user.list_transfers()
  @all_master_cat = MasterCategory.all()
  erb(:"categories/index")
end

get '/categories/:id' do #Read
  @category = Category.find_by_id( params[:id] )
  @user = User.all.first
  @cat_transfer = @user.list_transfers_by_category(params[:id])
  @transfers = @user.list_transfers()
  erb(:"categories/show")
end

get '/categories/:id/edit' do #update
  @category = Category.find_by_id( params[:id])
  @all_master_cat = MasterCategory.all()
  @user = User.all.first
  @transfers = @user.list_transfers()
  erb(:"categories/edit")
end

post '/categories/:id' do #update
  category = Category.new(params)
  category.update()
  @user = User.all.first
  @transfers = @user.list_transfers()
  redirect to ('/categories/' + "#{params[:id]}")
end

post '/categories/:id/delete' do #Delete
  category = Category.find_by_id( params[:id] )
  category.delete()
  @user = User.all.first
  @transfers = @user.list_transfers()
  redirect to '/categories'
end
