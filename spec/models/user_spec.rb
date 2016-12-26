require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Fixtures' do
    it 'should have a valid factory' do
      expect(FactoryGirl.create(:user)).to be_valid
    end
  end 

  describe '#roles' do
    it "writes and reads user's roles attribute" do
      user = FactoryGirl.create(:user)
      class Sheriff; end
      class Outlaw; end
      role_string = ['Sheriff', 'Outlaw', nil]
      role_class = [Sheriff, Outlaw]
      user.roles = role_string
      expect(user.roles).to eq role_class
    end
  end
end

