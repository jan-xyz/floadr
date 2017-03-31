require 'minitest/autorun'
require 'floadr'

class FlickrTest < Minitest::Test
  def test_querry_length_with_10_items
    sut = Flickr.new
    test_querry_list = Array.new(10, "test")
    assert_equal true, sut.is_querry_list_long_enough(test_querry_list)
  end

  def test_querry_length_with_1_items
    sut = Flickr.new
    test_querry_list = Array.new(1, "test")
    assert_equal false, sut.is_querry_list_long_enough(test_querry_list)
  end

  def test_querry_length_with_11_items
    sut = Flickr.new
    test_querry_list = Array.new(11, "test")
    assert_equal true, sut.is_querry_list_long_enough(test_querry_list)
  end

  def test_setting_flickr_api_key
    sut = Flickr.new
    test_api_key = "test_this"
    sut.set_api_key(test_api_key)
    assert_equal test_api_key, sut.get_api_key()
  end
end
