require('minitest/autorun')
require('minitest/emoji')
require_relative('../models/income.rb')

class TestIncome < MiniTest::Test
  def setup()
    @income1 = Income.new({
      'id' => "1",
      'amount' => 34.5,
      'user_id' => "1"
      })
  end

  def test_can_create_class()
    assert_equal(Income, @income1.class)
  end

  def test_can_get_user_id_int()
    assert_equal(1, @income1.user_id)
  end

  def test_can_update_amount()
    @income1.amount = 99.99
    assert_equal(99,99, @income1.amount)
  end
end
