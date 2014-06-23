def full_title custom=nil
  base_title = "Ruby on Rails Tutorial Sample App"
  if custom
    return "Ruby on Rails Tutorial Sample App" + " | " + custom
  else
    return "Ruby on Rails Tutorial Sample App"
  end
end
