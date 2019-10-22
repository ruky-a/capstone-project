module ApplicationHelper
  
  

    def avatar_url(user)
      if user.image
        "http://graph.facebook.com/#{user.uid}/picture?type=large"
      else
        gravatar_id = Digest::MD5.hexdigest(user.email).downcase
        "https://www.gravatar.com/avatar/#{gravatar_id}.jpg?d=identical&150"
  end
end
end




# def thumbnail input
#     return self.images.variant(resize: "300x300!").processed
#   end


# def thumbnail
#     return self.images.variant(resize: "300x300!").processed
#   end

# end

