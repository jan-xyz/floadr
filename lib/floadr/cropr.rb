require 'mini_magick'
require 'pathname'

class Cropr
  def initialize
    @output_dir = "./out/"
  end

  def crop_image(image_path)
    file_basename = Pathname.new(image_path).basename
    output_file = "%s%s.jpg" % [@output_dir, file_basename]
    image = MiniMagick::Image.open(image_path)
    image.crop("400x200+0+0")
    image.format("jpg")
    image.write(output_file)
    return output_file
  end

  def create_output_dir
    Dir.mkdir(@output_dir) unless File.exists?(@output_dir)
  end
end
