require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('../models/mastercategory.rb')
require_relative('../models/category.rb')
require_relative('../models/user.rb')
require_relative('../models/transfer.rb')
require_relative('../models/income.rb')
require_relative('../models/loan.rb')

get '/transfers' do
  @user = User.all.first
  @transfers = @user.list_transfers_by_date()
  erb(:"transfers/index")
end

get '/transfers/new/:category_id' do
  @user = User.all.first
  @transfers = @user.list_transfers()
  @category = Category.find_by_id(params[:category_id])
  erb(:"transfers/new")
end

post '/transfers' do #create
  @transfer = Transfer.new(params)
  @transfer.save()
  @user = User.all.first
  @transfers = @user.list_transfers()
  erb(:"transfers/index")
end

get '/transfers/:id' do #Read
  @transfer = Transfer.find_by_id( params[:id] )
  @user = User.all.first
  @transfers = @user.list_transfers()
  erb(:"transfers/show")
end

get '/transfers/:id/edit' do #update
  @transfer = Transfer.find_by_id( params[:id])
  @all_categories = Category.all()
  @user = User.all.first
  @transfers = @user.list_transfers()
  erb(:"transfers/edit")
end

post '/transfers/:id' do #update
  transfer = Transfer.new(params)
  transfer.update()
  @user = User.all.first
  @transfers = @user.list_transfers()
  redirect to ('/transfers/' + "#{params[:id]}")
end

post '/transfers/:id/delete' do #Delete
  transfer = Transfer.find_by_id( params[:id] )
  transfer.delete()
  @user = User.all.first
  @transfers = @user.list_transfers()
  redirect to '/transfers'
end
