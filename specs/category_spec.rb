require('minitest/autorun')
require('minitest/emoji')
require_relative('../models/category.rb')

class TestCategory < MiniTest::Test
  def setup()
    category1_data = {
      'id' => 1,
      'name' => "Gas",
      'master_category_id' => 1
    }
    @category1 = Category.new(category1_data)
  end

  def test_can_create_class()
    assert_equal(Category, @category1.class)
  end

  def test_can_update_name()
    @category1.name = "Electricity"
    assert_equal("Electricity", @category1.name)
  end

  def test_can_get_int_id()
    assert_equal(1, @category1.id)
  end

end
