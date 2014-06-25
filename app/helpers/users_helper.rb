module UsersHelper
  def gravatar_for user
    id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{id}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
end
