require 'rails_helper'

RSpec.describe LineItem, type: :model do
  describe 'requires a product and a cart' do
    let(:line_item_no_cart) {FactoryGirl.build_stubbed(:line_item, cart: nil)}
    let(:line_item_no_product) {FactoryGirl.build_stubbed(:line_item, product: nil)}

    specify {expect(line_item_no_cart).to be_invalid}
    specify {expect(line_item_no_product).to be_invalid}
  end
end
