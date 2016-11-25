class Task < ApplicationRecord

  validates :title, presence: true, length: { minimum: 4 }
  validates :description, presence: true, length: { minimum: 4 }
  validates :due_date, presence: true
  validates :priority, :inclusion => { :in => 0..5 }

end
