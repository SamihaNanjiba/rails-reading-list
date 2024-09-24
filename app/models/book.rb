class Book < ApplicationRecord
  validates :title, presence: true 
  validates :description, presence: true, length: { maximum: 100 }
  validates :year, presence: true
end
