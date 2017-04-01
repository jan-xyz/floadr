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

  def get_random_image_id()
    random_image_id = nil
    while random_image_id == nil
      search_term = get_random_search_term
      random_image_id = get_most_interesting_photo(search_term)
    end
    return random_image_id
  end

  def get_random_search_term()
    chosen_line = nil
    File.foreach("/usr/share/dict/words").each_with_index do |line, number|
      chosen_line = line if rand < 1.0/(number+1)
    end
    return chosen_line
  end

  def get_most_interesting_photo(search_string)
    sort = "interestingness_asc"
    photos = flickr.photos.search(:sort => sort, :text => search_string)
    photo = photos.first
    if photo == nil
      return nil
    else
      return photo.id
    end
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
