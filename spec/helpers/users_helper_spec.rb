require 'spec_helper'

describe UsersHelper do
  describe "#current_user?" do
    it "returns true if the given user is authenticated" do
      user = create(:user)
      helper.stub(:current_user) { user }
      expect(helper.current_user?(user)).to be(true)
    end
    
    it "returns false when given a different user" do
      user = create(:user)
      helper.stub(:current_user) { create(:user) }
      expect(helper.current_user?(user)).to be(false)
    end
    
    it "returns false when passed nil" do
      user = create(:user)
      helper.stub(:current_user) { nil }
      expect(helper.current_user?(user)).to be(false)
    end
  end
end

