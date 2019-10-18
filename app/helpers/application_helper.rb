module ApplicationHelper
  
  

    def avatar_url(user)
      if user.image
        "http://graph.facebook.com/#{user.uid}/picture?type=large"
      else
        gravatar_id = Digest::MD5.hexdigest(user.email).downcase
        "https://www.gravatar.com/avatar/#{gravatar_id}.jpg?d=identical&150"
  end
end

# def image
#   if @room.images.attached?
#  @room.images.variant(resize_to_limit: [100, 100])
#  else
#   gravatar_image_url(user.email, size: size)
# end
# end

def thumbnail
    return self.images.variant(resize: "300x300!").processed
  end

end

