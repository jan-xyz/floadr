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

  def process(input)
    photo_id, _ = @flickr.get_most_interesting_photo(input)
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
