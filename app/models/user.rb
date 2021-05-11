class User < ApplicationRecord
    include BCrypt

    validates :email, presence: true, uniqueness: true
    validates :first_name, :last_name, presence: true
    validates :password_hash, presence: true, length: { minimum: 6 }
    validate :confirm_pass

    has_many :notes, dependent: :destroy

    scope :login, -> (email) { where("email= ?", email)}

    def full_name
        "#{first_name.capitalize} #{last_name.capitalize}"
    end

    def password
        @password ||= Password.new(password_hash)
    end
      
    def password=(new_password)
        @password = Password.create(new_password)
        self.password_hash = @password
    end

    private
    def confirm_pass
        if BCrypt::Password.new(self.password_hash) != self.confirm_password
            errors.add(:confirm_password, 'does not match')
        else
            self.confirm_password = ''
        end
    end
end