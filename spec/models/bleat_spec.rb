require 'spec_helper'

describe Bleat do
  context "validations" do
    it "is invalid without any content" do
      bleat = build(:bleat, content: "")
      expect(bleat).to be_invalid
    end
  end
  
  describe "#owned_by?" do
    it "returns true when passed the owner of the bleat" do
      bleat = create(:bleat)
      expect(bleat.owned_by?(bleat.user)).to be(true)
    end
    
    it "returns false when passed another user" do
      bleat = create(:bleat)
      user = create(:user)
      expect(bleat.owned_by?(user)).to be(false)
    end
    
    it "returns false when passed nil" do
      bleat = create(:bleat)
      expect(bleat.owned_by?(nil)).to be(false)
    end
  end
end
