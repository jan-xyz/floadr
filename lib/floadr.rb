class Floadr
  def initialize
    @flickr = Flickr.new
    @flickr.initialize_api_key()
    @downloadr = Downloadr.new
    @downloadr.create_download_dir
    @cropr = Cropr.new
    @cropr.create_output_dir
  end

  def process(input)
    photo_id, _ = @flickr.get_most_interesting_photo(input)
    photo_url = @flickr.get_photo_url(photo_id)
    file_path = @downloadr.download_image(photo_url)
    @cropr.crop_image_to_square(file_path)
  end
end

require 'floadr/flickr'
require 'floadr/downloadr'
require 'floadr/cropr'
