require 'spec_helper.rb'

describe "routes for Products", type: :routing do
  let(:product){FactoryGirl.create(:product)}
  # Need to use .create because we actually need a product id to test (save to db)

  it "routes /products to products#index" do
    expect(get: "/products").to route_to(controller: "products", action: "index")
  end

  it "routes /products/id to products#show" do
    expect(get: "/products/#{product.id}").to route_to(controller: "products", action: "show", id: "#{product.id}")
  end
  # alternatively, the above test can be written in the following way - not necessary to actually create a new product
  it "routes /products/id to products#show" do
    expect(get: "/products/1").to route_to(controller: "products", action: "show", id: "1") #this is a string because it maps to URL
  end

  it "routes /products/new to products#new" do
    expect(get: "/products/new").to route_to(controller: "products", action: "new")
  end

  it "routes /products/id/edit to products#edit" do
    expect(get: "/products/#{product.id}/edit").to route_to(controller: "products", action: "edit", id: "#{product.id}")
  end

  it "delete routes /products/id to products#destroy" do
    expect(delete: "/products/#{product.id}").to route_to(controller: "products", action: "destroy", id: "#{product.id}")
  end

  it "create routes /products to products#create" do
    expect(post: "/products").to route_to(controller: "products", action: "create")
  end

end
