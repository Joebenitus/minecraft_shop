require 'rails_helper'

describe Product do
  it { should have_many(:reviews) }

  it { should validate_presence_of :name}
  it { should validate_presence_of :cost}
  it { should validate_presence_of :country_of_origin}

  it("titleizes the name of the product") do
    product = Product.create!({name: "iron shovel", cost: 5.00, country_of_origin: "America"})
    expect(product.name()).to(eq("Iron Shovel"))
  end
end