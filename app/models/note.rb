class Note < ApplicationRecord
  validates :title, presence: true, length: { maximum: 30 }
  validates :body, length: { maximum: 1000 }

  belongs_to :user

  def day_time
    self.created_at.strftime("%a, %B %d at %I:%M %p")
  end

end
