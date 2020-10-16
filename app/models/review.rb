class Review < ApplicationRecord
  belongs_to :product

  validates :author, presence: true
  validates :content_body, presence: true
  validates :rating, presence: true
  validates :product_id, presence: true

  validates_inclusion_of :rating, in: 1..5
  validates :content_body, length: { in: 50..250 }

end