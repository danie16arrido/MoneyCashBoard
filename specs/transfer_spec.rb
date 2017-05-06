require('minitest/autorun')
require('minitest/emoji')
require_relative('../models/transfer.rb')
require_relative('../models/user.rb')
require_relative('../models/category.rb')
require_relative('../models/mastercategory.rb')


class TestTransfer < MiniTest::Test
  def setup()
    @m_category1 = MasterCategory.new({'id' => '1', 'name' => "Bills"})
    category1_data = {
      'id' => 1,
      'name' => "Gas",
      'master_category_id' => @m_category1.id
    }
    @category1 = Category.new(category1_data)
    user1_data = {
      'id' => "1",
      'first_name' => "Daniel",
      'last_name' => "Garrido",
      'dob' => "21/06/1976"
    }
    @user1 = User.new(user1_data)
    transfer1_data = {
      'amount' => 30,
      'op_data' => "21/01/1988",
      'time' => "10:32",
      'user_id' => @user1.id,
      'category_id' => @category1.id
    }
    @transfer1 = Transfer.new(transfer1_data)
  end

  def test_can_create_class()
    assert_equal(Transfer, @transfer1.class)
  end

  def test_can_update_amount()
    @transfer1.amount = 99.99
    assert_equal(99.99, @transfer1.amount)
  end
end
