require('pry-byebug')

require_relative('../models/mastercategory.rb')
require_relative('../models/category.rb')
require_relative('../models/user.rb')

MasterCategory.delete_all()
Category.delete_all()
User.delete_all()

mcat = MasterCategory.new({'name' => "Bills"})
mcat.save()
cate = Category.new({'name' => "Gas", 'master_category_id' => mcat.id})
cate.save()

user1 = User.new({
  'first_name' => "Daniel",
  'last_name' => "Garrido",
  'dob' => "21/06/1976"
  })
user1.save()  








binding.pry

nil
