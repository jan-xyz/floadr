require 'minitest/autorun'
require 'floadr'

class FlickrTest < Minitest::Test
  def setup
    @sut = Flickr.new
  end

  def test_querry_length_with_10_items
    test_querry_list = Array.new(10, "test")
    assert_equal true, @sut.is_querry_list_long_enough(test_querry_list)
  end

  def test_querry_length_with_1_items
    test_querry_list = Array.new(1, "test")
    assert_equal false, @sut.is_querry_list_long_enough(test_querry_list)
  end

  def test_querry_length_with_11_items
    test_querry_list = Array.new(11, "test")
    assert_equal true, @sut.is_querry_list_long_enough(test_querry_list)
  end

  def test_setting_flickr_api_key
    test_api_key = "test_this"
    @sut.set_api_key(test_api_key)
    assert_equal test_api_key, @sut.get_api_key()
  end

  def test_reading_api_key_from_environment_variable
    test_key = "test_key_env"
    ENV["FLICKR_API_KEY"] = test_key
    key = @sut.read_api_key()
    assert_equal key, test_key
  end

  def test_reading_empty_enviornment_variable
    ENV.delete("FLICKR_API_KEY")
    assert_raises RuntimeError do
      @sut.read_api_key()
    end
  end

  def test_initializing_api_key
    test_key = "test_key_env"
    ENV["FLICKR_API_KEY"] = test_key
    @sut.initialize_api_key()
    key = @sut.get_api_key()
    assert_equal key, test_key
  end
end
