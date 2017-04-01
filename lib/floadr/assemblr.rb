require 'mini_magick'

class Assemblr

  def combine_images(image_list, output_file)
    MiniMagick::Tool::Montage.new do |montage|
      montage.geometry '+0+0'
      montage.background 'none'
      for image in image_list
        montage << image
      end
      montage << output_file
      montage.call
    end
  end
end
