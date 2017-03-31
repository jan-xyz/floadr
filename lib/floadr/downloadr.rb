require "open-uri"
require 'digest/md5'
class Downloadr

  def download_image(url)
    cache_dir = './downloads'
    Dir.mkdir cache_dir unless File.exists?(cache_dir)
    filename = Digest::MD5.hexdigest(url)
    full_file_path = "%s/%s.jpg" % [cache_dir, filename]
    open(url) {|f|
       File.open(full_file_path,"wb") do |file|
         file.puts f.read
       end
    }
  end

end
