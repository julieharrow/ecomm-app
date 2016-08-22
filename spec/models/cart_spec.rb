require 'rails_helper'

RSpec.describe Cart, type: :model do
  it "requires a user" do
    cart = FactoryGirl.build_stubbed(:cart, user: nil)

    expect(cart).to be_invalid
  end
end
