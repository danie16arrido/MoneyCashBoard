require('pry-byebug')

require_relative('../models/mastercategory.rb')
require_relative('../models/category.rb')
require_relative('../models/user.rb')
require_relative('../models/transfer.rb')
require_relative('../models/income.rb')
require_relative('../models/loan.rb')

`dropdb moneydboard`
`createdb moneydboard`
`psql -d moneydboard -f db/moneydboardtables.sql`
# Category.delete_all()
# MasterCategory.delete_all()
# User.delete_all()

mcat = MasterCategory.new({'name' => "Bills"})
mcat.save()
cat1 = Category.new({'name' => "Gas", 'master_category_id' => mcat.id})
cat1.save()
cat2 = Category.new({'name' => "Electricity", 'master_category_id' => mcat.id})
cat2.save()

incomes_cat = MasterCategory.new({'name' => "Incomes"})
incomes_cat.save()
salary = Category.new({'name' => "Salary", 'master_category_id' => incomes_cat.id})
salary.save()

loans_cat = MasterCategory.new({'name' => "Incomes"})
loans_cat.save()
barclays = Category.new({'name' => "Barclays Bank", 'master_category_id' => loans_cat.id})
barclays.save()



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
transfer1.save()

transfer2 = Transfer.new({
  'amount' => 44.56,
  'user_id' => user1.id,
  'category_id' => cat2.id
  })
transfer2.save()

income1 = Income.new({
  'amount' => 99.99,
  'provider' => incomes_cat.id,
  'user_id' => user1.id
  })

loan1 = Loan.new({
  'amount' => 4500,
  'provider' => barclays.id,
  'user_id' => user1.id
  })









binding.pry

nil
