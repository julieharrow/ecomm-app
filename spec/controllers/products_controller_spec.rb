require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

  describe "routes for Products" do
    let(:product){FactoryGirl.create(:product)}
    specify{expect(get: "/products").to route_to("products#index")}
    specify{expect(get: "/products/#{product.id}").to route_to("products#show", id: "#{product.id}")}
    specify{expect(get: "/products/#{product.id}/edit").to route_to("products#edit", id: "#{product.id}")}
    specify{expect(get: "/products/new").to route_to("products#new")}
    specify{expect(delete: "/products/#{product.id}").to route_to("products#destroy", id: "#{product.id}")}
    specify{expect(post: "/products").to route_to("products#create")}
  end

  context "when admin is logged in" do
    let(:admin) {FactoryGirl.create(:admin_user)}

    before do
      sign_in(admin)
    end

    describe "GET #new" do
      it "returns http success" do
        get :new

        expect(response).to have_http_status(:success)
      end
      it "assigns @product to a new Product" do
        get :new

        expect(assigns(:product)).to be_a_new(Product)
      end
    end

    describe "POST #create" do
      it "creates a product" do
        post :create, product: FactoryGirl.attributes_for(:product)
        #'attributes_for' provides the attributes as a hash

        expect(Product.count).to eq(1)
        expect(response).to redirect_to(product_path(assigns[:product]))
      end
    end

    describe "GET #index" do
      it "returns http success" do
        get :index

        expect(response).to have_http_status(:success)
      end
    end

    describe "GET #show" do
      let(:product) {FactoryGirl.create(:product)}
      # need to .create so that the instance has a specific ID in order for it to be visited

      it "returns http success" do
        get :show, id: product # or product.id

        expect(response).to have_http_status(:success)
      end
      it "assigns requested product to @product" do
        get :edit, id: product # or product.id

        expect(assigns(:product)).to eq(product)
      end
    end

    describe "GET #edit" do
      let(:product) {FactoryGirl.create(:product)}

      it "returns http success" do
        get :edit, id: product # or product.id

        expect(response).to have_http_status(:success)
      end
      it "assigns requested product to @product" do
        get :edit, id: product # or product.id

        expect(assigns(:product)).to eq(product)
      end
    end

    describe "PUT #update" do
      let(:product) {FactoryGirl.create(:product)}
      let(:product_params_hash) {FactoryGirl.attributes_for(:product, name: "Chromebook")}

      it "updates the product attributes" do
        put :update, id: product, product: product_params_hash
        product.reload

        expect(product.name).to eql("Chromebook")
      end

      it "redirects to the show page" do
        put :update, id: product, product: product_params_hash

        expect(response).to redirect_to(product)
      end
    end

    describe "DELETE #destroy" do
      let(:product) {FactoryGirl.create(:product)}

      it "deletes the product and redirects to index page" do
        delete :destroy, id: product
        expect(response).to redirect_to(products_path)
      end
    end
  end

  context "when non-admin is logged in" do
    let(:user) {FactoryGirl.create(:non_admin_user)}

    before do
      sign_in(user)
    end

    describe "GET #new" do
      it "redirects_to root_path" do
        get :new

        expect(response).to redirect_to root_path
      end
    end

    describe "GET #index" do
      it "redirects to root_url" do  # use URL in the event that the domain of the root is different than the origin URL where the redirect is called
        get :index

        expect(response).to redirect_to root_path
      end
    end

    describe "GET #edit" do
      let(:product) {FactoryGirl.create(:product)}

      it "redirects_to root_path" do
        get :new

        expect(response).to redirect_to root_path
      end
    end

    describe "GET #show" do
      let(:product) {FactoryGirl.create(:product)}

      it "returns http success" do
        get :show, id: product
        expect(response).to have_http_status(:success)
      end

      it "assigns requested product to @product" do
        get :show, id: product

        expect(assigns(:product)).to eq(product)
      end
    end

  end
end
