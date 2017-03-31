require 'flickraw'

class Flickr
  def initialize()
    FlickRaw.api_key=""
    FlickRaw.shared_secret=""
  end

  def set_api_key(api_key)
    FlickRaw.api_key=api_key
  end

  def get_api_key()
    return FlickRaw.api_key
  end

  def read_api_key()
    key = ENV["FLICKR_API_KEY"]
    if key == nil
      raise "FLICKR_API_KEY environment variable not set"
    end
    return key
  end

  def is_querry_list_long_enough(querry_list)
    list_length = querry_list.length()
    if list_length >= 10
      return true
    else
      return false
    end
  end


end
