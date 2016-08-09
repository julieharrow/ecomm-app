require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'name' do
    it "can't be nil" do
      user = FactoryGirl.build(:user, name: nil) #use build because we do not want to save it

      expect(user).to be_invalid
    end
  end

  describe 'admins' do
    it "returns all admins" do
      all_admins = FactoryGirl.create_list(:user, 2, admin: true)
      non_admin_users = FactoryGirl.create_list(:user, 2, admin: false)

      expect(User.admins).to eq(all_admins)
    end
  end
end
