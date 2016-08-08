require 'rails_helper'

RSpec.describe Product, type: :model do
  # 'type: :model' is redundant because this file is in the spec/model directory

  describe "name" do
    it "cannot be empty" do
      product = FactoryGirl.build(:product, name: nil)

      expect(product).to_not be_valid
    end
  end

  describe "stock" do
    it "cannot be empty" do
      product = FactoryGirl.build(:product, stock: nil)

      expect(product).to_not be_valid
    end
    it "cannot be negative" do
      product = FactoryGirl.build(:product, stock: -1)

      expect(product).to_not be_valid
    end
  end

  describe "description" do
    it "cannot be empty" do
      product = FactoryGirl.build(:product, description: nil)

      expect(product).to_not be_valid
    end
    it "cannot be longer than 50 chars" do
      product = FactoryGirl.build(:product, description: "123456789012345678901234567890123456789012345678901")
  
      expect(product).to_not be_valid
    end
    it "cannot be shorter than 5 chars" do
      product = FactoryGirl.build(:product, description: "1234")

      expect(product).to_not be_valid
    end
  end

  describe "price" do
    it "cannot be empty" do
      product = FactoryGirl.build(:product, price: nil)

      expect(product).to_not be_valid
    end
    it "cannot have 3 or more numbers after the decimal point" do
      product = FactoryGirl.build(:product, price: 10.123)

      expect(product).to_not be_valid
    end
  end

  describe ".promoted" do
    it "returns products that are only marked true for front_page" do
      promo_product_list = FactoryGirl.create_list(:product, 2, promoted: true)
      nonpromo_product_list = FactoryGirl.create_list(:product, 2, promoted: false)
      expect(Product.promoted).to eq(promo_product_list)
    end
  end
end
