require('minitest/autorun')
require('minitest/emoji')
require_relative('../models/income.rb')
require_relative('../models/loan.rb')

class TestLoan < MiniTest::Test
  def setup()
    @loan1 = Loan.new({
      'id' => "1",
      'amount' => 34.5,
      'user_id' => "1",
      'is_payed' => false
      })
  end

  def test_can_create_class()
    assert_equal(Loan, @loan1.class)
  end

  def test_can_get_user_id_int()
    assert_equal(1, @loan1.user_id)
  end

  def test_can_update_amount()
    @loan1.amount = 99.99
    assert_equal(99,99, @loan1.amount)
  end

  def test_can_update_is_payed()
    @loan1.is_payed = true
    assert_equal(true, @loan1.is_payed)
  end

end
