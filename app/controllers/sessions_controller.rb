class SessionsController < ApplicationController

    def login
      if logged_in?
        redirect_to notes_path
      end
    end

    def signup
        @user = User.new
    end

    def new_session
        @user = User.login(login_params[:email])
        valid_user = false

        #first check if user object is empty
        if @user.first
            valid_user = validate_user?(@user.first.password, login_params[:password])
        end

        respond_to do |format|
            if valid_user
                session[:current_user] = @user
                format.html { redirect_to notes_path, notice: "login successfully" }
            else
                format.html { render 'login', notice: "login unsuccessful" }
            end
        end
    end

    
    
    def registration
        @user = User.new(first_name: signup_params[:first_name], last_name: signup_params[:last_name], email: signup_params[:email])

        @user.password = signup_params[:password]
        @user.confirm_password = signup_params[:confirm_password]
        
        respond_to do |format|
            if @user.save
                session[:current_user] = [@user]
                format.html { redirect_to notes_path, notice: "signup successfully" }
            else
                format.html { render 'signup'}
            end
        end 
    end

    def destroy_session
        session[:current_user] = nil
        redirect_to login_path, notice: "signout successful"
    end

    private
    def signup_params
        params.permit(:first_name, :last_name, :email, :password, :confirm_password, :authenticity_token, :commit)
    end

    def login_params
        params.permit(:email, :password, :authenticity_token, :commit)
    end

    def validate_user?(user_pass, client_pass)
        user_pass == client_pass
    end
end
