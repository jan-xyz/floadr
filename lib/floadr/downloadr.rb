require 'open-uri'
require 'digest/md5'
class Downloadr

  def initialize
    @cache_dir = './downloads'
  end

  def download_image(url)
    filename = Digest::MD5.hexdigest(url)
    full_file_path = "%s/%s.jpg" % [@cache_dir, filename]
    open(url) {|f|
       File.open(full_file_path,"wb") do |file|
         file.puts f.read
       end
    }
    return full_file_path
  end

  def create_download_dir
    Dir.mkdir @cache_dir unless File.exists?(@cache_dir)
  end

end
