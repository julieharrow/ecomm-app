require 'spec_helper.rb'

describe "routes for Products", type: :routing do
  it "routes /products to products#index" do
    expect(get: "/products").to route_to(controller: "products", action: "index")
  end

  it "routes /products/id to products#show" do
    expect(get: "/products/#{product.id}").to route_to(controller: "products", action: "show", id: "#{product.id}")
  end
end
