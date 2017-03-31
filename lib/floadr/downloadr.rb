require "open-uri"
require 'digest/md5'
class Downloadr

  def download_image(url)
    Dir.mkdir './downloads'
    filename = Digest::MD5.hexdigest(url)
    full_file_path = "./downloads/%s.jpg" % filename
    open(url) {|f|
       File.open(full_file_path,"wb") do |file|
         file.puts f.read
       end
    }
  end

end
