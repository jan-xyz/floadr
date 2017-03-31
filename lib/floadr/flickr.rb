class Flickr
  def initialize()
  end

  def querry(querry_list)
  end

  def is_querry_list_long_enough(querry_list)
    list_length = querry_list.length()
    if list_length >= 10
      return true
    else
      return false
    end
  end


end
