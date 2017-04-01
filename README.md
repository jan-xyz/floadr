# floadr
a flickr downloader

> I am a Python developer with a few trials with Ruby. Bare with me if I am not yet used to the canonical approach. I am learning and will do better soon.

## Installation
make sure to have imagemagick installed on your test system. Installation instructions can be found here: https://www.imagemagick.org/script/binary-releases.php

```shell
gem install FlickRaw minimagick
gem build ./floadr.gemspec
gem install floadr-*.gem
```

## Usage
```shell
floadr --search-term cat,dog,house,elephant,car,bucket --output-file out4.jpg
```
