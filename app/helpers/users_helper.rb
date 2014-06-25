module UsersHelper
  def gravatar_for user, params={ size: 150}
    id = Digest::MD5::hexdigest(user.email.downcase)
    size = params[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar thumbnail")
  end
end
