require 'flickraw'

class Flickr
  def initialize()
    FlickRaw.api_key=""
    FlickRaw.shared_secret=""
  end

  def initialize_api_key()
    api_key = read_api_key()
    set_api_key(api_key)
  end

  def read_api_key()
    key = ENV["FLICKR_API_KEY"]
    if key == nil
      raise "FLICKR_API_KEY environment variable not set"
    end
    return key
  end

  def set_api_key(api_key)
    FlickRaw.api_key=api_key
  end

  def get_api_key()
    return FlickRaw.api_key
  end

  def get_most_interesting_photo(search_string)
    sort = "interestingness_asc"
    photos = flickr.photos.search(:sort => sort, :text => search_string)
    photo = photos.first
    return photo.id, photo.owner
  end

  def get_photo_url(photo_id)
    info = flickr.photos.getInfo(:photo_id => photo_id)
    photo_url = FlickRaw.url_b(info)
    return photo_url
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
