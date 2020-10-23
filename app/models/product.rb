class Product < ApplicationRecord

  scope :three_most_recent, -> { order(created_at: :desc).limit(3)}
  scope :in_united_states, -> { where(country_of_origin: "United States") }

  scope :most_reviews, -> {(
    select("products.id, products.name, count(reviews.id) as reviews_count")
    .joins(:reviews)
    .group("products.id")
    .order("reviews_count DESC")
    .limit(1)
    )}

  has_many :reviews, dependent: :destroy

  validates :name, presence: true
  validates :cost, presence: true
  validates :country_of_origin, presence: true

  before_save(:titleize_product)

  private
    def titleize_product
      self.name = self.name.titleize
    end
end