class User < ApplicationRecord
    validates :email, presence: true, uniqueness: true
    validates :first_name, :last_name, presence: true
    validates :password, presence: true, length: { in: 6..10 }
    validate :confirm_pass

    has_many :notes, dependent: :destroy

    scope :login, -> (email) { where("email= ?", email)}


    private
    def confirm_pass
        if self.password != self.confirm_password
            errors.add(:confirm_password, 'does not match')
        end
    end
end
