class Course < ApplicationRecord

  belongs_to :user
  has_many :reviews

  validates :name, presence: true

  validates :price, presence: true, numericality: {
      greater_than_or_equal_to: 0
  }



end
