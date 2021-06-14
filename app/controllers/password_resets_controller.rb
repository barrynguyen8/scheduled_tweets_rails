class PasswordResetsController < ApplicationController
    def new
    end 
    
    def create
        @user = User.find.by(email: params[:email])
        
        if @user.present?
            # send email
            PasswordMailer.with(user: @user).reset.deliver_later #with - sets params inside mailer 
        end 
            redirect_to root_path, notice: "If an account with that email was found, we have sent a link to reset your password"
    end 
end 