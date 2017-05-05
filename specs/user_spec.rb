require('minitest/autorun')
require('minitest/emoji')
require_relative('../models/User.rb')


class TestUsers < MiniTest::Test
  def setup()
    user1_data = {
      'first_name' => "Daniel",
      'last_name' => "Garrido",
      'dob' => "21/06/1976",
      'id' => "1"
    }
    @user1 = User.new(user1_data)
  end

  def test_can_create_user()
    assert_equal(User, @user1.class)
  end

  def test_can_get_first_name()
    assert_equal("Daniel", @user1.first_name)
  end

  def test_can_get_int_id()
    assert_equal(1, @user1.id)
  end

  def test_can_get_last_name()
    assert_equal("Garrido", @user1.last_name)
  end

  def test_can_get_dob()
    assert_equal("21/06/1976", @user1.dob)
  end

  def test_update_name()
    @user1.first_name = "Juan"
    assert_equal("Juan", @user1.first_name)
  end

end
