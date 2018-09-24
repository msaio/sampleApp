module SessionsHelper
    def log_in(user)
        session[:user_id] = user.id
    end

    def current_user
        if session[:user_id]
            # way 1:
            @current_user ||= User.find_by(id: session[:user_id])
            # way 2:
            # @current_user = @current_user || User.find_by(id: session[:user_id])
            # way 3:
            # if @current_user.nil?
            #     @current_user = User.find_by(id: session[:user_id])
            # else
            #     @current_user
            # end
        end
    end
    
    def logged_in?
        !current_user.nil?
    end
end