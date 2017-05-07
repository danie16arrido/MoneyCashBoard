require('pry-byebug')

require_relative('../models/mastercategory.rb')
require_relative('../models/category.rb')
require_relative('../models/user.rb')
require_relative('../models/transfer.rb')
require_relative('../models/income.rb')
require_relative('../models/loan.rb')


`psql -d moneydboard -f db/moneydboardtables.sql`

housing = ['Mortgage', 'Rent', 'Council_Tax']
utilities = ['Electricity', 'Gas', 'Internet']
food = ['Groceries', 'Take_Away', 'Home_Delivery']
clothing = ['Clothing', 'Shoes']
house_hold = ['Toiletries', 'Laundry', 'Cleaning', 'Tools']
personal = ['Gym', 'Haircut', 'Cosmetics']
entertainment = ['Pub', 'Restaurant', 'Game', 'Movie', 'Concert', 'Netflix', 'Amazon_Prime']
transportation = ['Ridacard', 'm_tickets', 'single', 'Train']
gifts = ['Birthday', 'Wedding', 'Christmas']
insurence = ['Life', 'Health', 'Homeowner']
car = ['Diesel', 'Tires', 'Tax', 'Repairs', 'Servicing']
vacation = ['Flight', 'Train', 'Accommodation', 'Food']

incomes = ['Wages', "Dad''s Christmas"]
loans = ['Barclays', 'Credit_Card', 'Mum']

all_categories = [
['Housing' , housing],
['Utilities', utilities],
['Food', food],
['Clothing', clothing],
['HouseHold', house_hold],
['Personal', personal],
['Entertainment', entertainment],
['Transportation', transportation],
['Gifts', gifts],
['Insurence', insurence],
['Car', car],
['Vacation', vacation],
['Incomes', incomes],
['Loans', loans]
]

def populate_categories(all_categories)
  all_categories.each do |master_category|
    m_category = MasterCategory.new({'name' => master_category[0]})
    m_category.save()
    master_category[1].each do |a_category|
      category = Category.new({
        'name' => a_category,
        'master_category_id' => m_category.id
      })
      category.save()
    end
  end
end
populate_categories(all_categories)

def mk_user_object(first_name, last_name, dob)
  hash = {
  'first_name' => "Daniel",
  'last_name' => "Garrido",
  'dob' => "21/06/1976"
  }
  return User.new(hash)
end

user1 = mk_user_object("Daniel", "Garrido", "21/06/1976")
user1.save()

user2 = mk_user_object("Maria", "Sanchez", "112/01/1976")
user2.save()

def mk_transfer_object(amount, user_id, category_id)
  hash = {
    'amount' => amount,
    'user_id' => user_id,
    'category_id' => category_id
    }
    return Transfer.new(hash)
end

transfer1 = mk_transfer_object(899.99, user1.id, 1)
transfer1.save()

transfer2 = mk_transfer_object(120, user1.id, 2)
transfer2.save()

transfer3 = mk_transfer_object(850, user1.id, 3)
transfer3.save()

transfer4 = mk_transfer_object(120, user2.id, 3)
transfer4.save()

transfer5 = mk_transfer_object(330, user1.id, 10)
transfer5.save()

transfer6 = mk_transfer_object(350, user2.id, 10)
transfer6.save()


binding.pry

nil
