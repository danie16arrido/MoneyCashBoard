require('pry-byebug')

require_relative('../models/mastercategory.rb')
require_relative('../models/category.rb')
require_relative('../models/user.rb')
require_relative('../models/transfer.rb')
require_relative('../models/income.rb')

# Category.delete_all()
# MasterCategory.delete_all()
# User.delete_all()

mcat = MasterCategory.new({'name' => "Bills"})
mcat.save()
cat1 = Category.new({'name' => "Gas", 'master_category_id' => mcat.id})
cat1.save()

incomes_cat = MasterCategory.new({'name' => "Incomes"})
incomes_cat.save()
salary = Category.new({'name' => "Salary", 'master_category_id' => incomes_cat.id})
salary.save()

user1 = User.new({
  'first_name' => "Daniel",
  'last_name' => "Garrido",
  'dob' => "21/06/1976"
  })
user1.save()

transfer1 = Transfer.new({
  'amount' => 99.99,
  'user_id' => user1.id,
  'category_id' => cat1.id
  })

income1 = Income.new({
  'amount' => 99.99,
  'provider' => incomes_cat.id,
  'user_id' => user1.id
  })








binding.pry

nil
