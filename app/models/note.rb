class Note < ApplicationRecord
  validates :user_id, :title, presence: true
  validates :title, length: { maximum: 30 }
  validates :body, length: { maximum: 1000 }

  belongs_to :user

  def day_time
    self.created_at.strftime("%a, %B %d at %I:%M %p")
  end

end
