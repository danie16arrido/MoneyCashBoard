require('minitest/autorun')
require('minitest/emoji')
require_relative('../models/mastercategory.rb')


class TestMasterCategory < MiniTest::Test
  def setup()
    @m_category = MasterCategory.new({'id' => '1', 'name' => "Bills"})
  end

  def test_can_get_name()
    assert_equal("Bills", @m_category.name)
  end

  def test_can_get_int_id()
    assert_equal(1, @m_category.id)
  end

  def test_can_update()
    @m_category.name = "Enjoyment"
    assert_equal("Enjoyment", @m_category.name)
  end
  
end
