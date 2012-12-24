require 'spec_helper'

describe User do
  context "validations" do
    it "is invalid without an email" do
      user = build(:user, email: "")
      expect(user).to be_invalid
    end
  end
end
