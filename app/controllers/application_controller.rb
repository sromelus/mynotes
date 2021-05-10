class ApplicationController < ActionController::Base

    def login_required
        if !session[:current_user]
            redirect_to login_path, :alert => "You must first log in or sign up before accessing this page."
        end
    end

    def logged_in?
      !session[:current_user].blank?
    end        
end
