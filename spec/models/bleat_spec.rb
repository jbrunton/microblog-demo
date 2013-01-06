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
  
  describe "#hash_tags" do
    it "creates a hash tag after being saved" do
      bleat = build(:bleat, :content => "#winning")
      bleat.hash_tags.should_receive(:build).
        with(:tag => "#winning")
      bleat.save
    end
    
    it "downcases the tag" do
      bleat = build(:bleat, :content => "#wiNnINg")
      bleat.hash_tags.should_receive(:build).
        with(:tag => "#winning")
      bleat.save
    end
  end
end
