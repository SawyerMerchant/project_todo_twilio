class Task < ApplicationRecord

  validates :title, presence: true, length: { minimum: 4 }
  validates :description, presence: true, length: { minimum: 4 }
  validates :due_date, presence: true

end
