require 'rails_helper'

RSpec.describe HomesController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "returns only promoted products" do
      promoted_products = FactoryGirl.create_list(:product, 10, promoted: true)
      non_promoted_products = FactoryGirl.create_list(:product, 2, promoted: false)
      get :index #no colon

      expect(assigns(:products)).to eq(promoted_products)
    end
  end
end
