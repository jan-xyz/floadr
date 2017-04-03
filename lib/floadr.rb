class Floadr
  def initialize
    @flickr = Flickr.new
    @flickr.initialize_api_key()
    @downloadr = Downloadr.new
    @downloadr.create_download_dir
    @cropr = Cropr.new
    @cropr.create_output_dir
    @assemblr = Assemblr.new
    @image_list = []
  end

  def get_ten_images(search_terms)
    id_list = []
    for search_term in search_terms
      photo_id = @flickr.get_most_interesting_photo(search_term)
      if not photo_id == nil
        id_list << photo_id
      end
    end
    until_ten = 10 - id_list.length
    until_ten.times do
      id_list << @flickr.get_random_image_id
    end
    for id in id_list
      process(id)
    end
  end

  def process(photo_id)
    photo_url = @flickr.get_photo_url(photo_id)
    file_path = @downloadr.download_image(photo_url)
    cropped_file = @cropr.crop_image(file_path)
    @image_list << cropped_file
  end

  def build(output_file)
    @assemblr.combine_images(@image_list, output_file)
  end
end

require 'floadr/flickr'
require 'floadr/downloadr'
require 'floadr/cropr'
require 'floadr/assemblr'
