Gem::Specification.new do |s|
  s.name        = 'floadr'
  s.version     = '0.0.2'
  s.date        = '2017-03-31'
  s.summary     = "Flickr Download!"
  s.description = "a command line tool do download from Flickr"
  s.authors     = ["Jan Steinke"]
  s.email       = 'jan.steinke@gmail.com'
  s.files       = [
    "lib/floadr.rb",
    "lib/floadr/flickr.rb",
    "lib/floadr/downloadr.rb"]
  s.add_runtime_dependency "flickraw", ["= 0.9.9"]
  s.add_development_dependency 'rake', '~> 1.6', '>= 1.6.5'
  s.executables << 'floadr'
  s.homepage    = "http://jan-steinke.de"
  s.license     = 'MIT'
end
