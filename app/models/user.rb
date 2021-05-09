class User < ApplicationRecord
    validates :email, presence: true, uniqueness: true
    validates :first_name, :last_name, presence: true
    validates :password, presence: true, length: { in: 6..10 }
    validate :confirm_pass

    has_many :notes, dependent: :destroy

    # def self.authenticate(login, pass)
    #     user = find_by_email(login)
    #     return user if user && user.password_hash == user.encrypt_password(pass)
    # end
    
    # def encrypt_password(pass)
    #     BCrypt::Engine.hash_secret(pass, password_salt)
    # end


    private
    def confirm_pass
        if self.password != self.confirm_password
            errors.add(:confirm_password, 'and password must be the same')
        end
    end
end
