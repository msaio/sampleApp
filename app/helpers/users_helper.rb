module UsersHelper
    # Return the Gravatar for the given user.
    def gravatar_for(user, options_con_cac = {size:160})
        gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
        size_cai_dit_me_may = options_con_cac[:size]
        gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size_cai_dit_me_may}"
        image_tag(gravatar_url, alt: user.name, class: "gravatar")
    end
end
