require 'rails_helper'

RSpec.describe CartsController, type: :controller do

  describe "GET #show" do
    let(:cart){FactoryGirl.create(:cart)}

    it "returns http success" do
      get :show, id: cart
      expect(response).to have_http_status(:success)
    end
  end

end
