#email:string
#password_digest:string
#
#password: string virtual
#password_confirmation:string virtual 

class User < ApplicationRecord
    has_secure_password #uses password_digest column in database
    
    validates :email, presence: true #validate if email address is entered
    # can add email regex to validator 
end
