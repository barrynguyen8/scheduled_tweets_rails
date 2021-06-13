class RegistrationsController < ApplicationController
    def new
        @user = User.new #instance variable makes it visible in app/views
    end 
    
    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id #add into session cookie as user_id from database 
            redirect_to root_path, notice: "Successfully created account"
        else
            render :new 
        end 
    end 
    
    private #helper method 
    
    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
    end 
end 