require('pry-byebug')

require_relative('../models/mastercategory.rb')
require_relative('../models/category.rb')

MasterCategory.delete_all()
Category.delete_all()

mcat = MasterCategory.new({'name' => "Bills"})
mcat.save()
cate = Category.new({'name' => "Gas", 'master_category_id' => mcat.id})
cate.save()








binding.pry

nil
