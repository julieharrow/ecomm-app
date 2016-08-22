require 'rails_helper'

RSpec.describe "homes/index.html.erb", type: :view do
  let(:promo_products_list) {FactoryGirl.build_stubbed_list(:product, 10, promoted:true)}
  let(:non_promo_products_list) {FactoryGirl.build_stubbed_list(:product, 2, promoted:false)}

  it "renders #index with the correct dom elements" do
    assign(:products, promo_products_list)
    render

    expect(rendered).to have_content("Welcome to Tech Village!")
  end

  it "renders #index with the correct products" do
    assign(:products, promo_products_list)
    render

    promo_products_list.each do |product|
      expect(rendered).to have_content(product.name)
      expect(rendered).to have_selector("#myModal_#{product.id}")
    end
  end
end
