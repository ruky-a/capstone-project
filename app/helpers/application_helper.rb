module ApplicationHelper
  
  

#     def avatar_url(user)
#       if user.avatar.attached?
#         "http://graph.facebook.com/#{user.uid}/picture?type=large"
#       else
#         gravatar_id = Digest::MD5.hexdigest(user.email).downcase
#         "https://www.gravatar.com/avatar/#{gravatar_id}.jpg?d=identical&150"
#   end
# end

def avatar_for(user, options = {size: 40})
  if user.avatar.attached?
    "http://graph.facebook.com/#{user.uid}/picture?type=large"
  else
    gravatar_id = Digest::MD5::hexdigest(user.email).downcase
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.email, class: "rounded-circle")
  end
end

end




