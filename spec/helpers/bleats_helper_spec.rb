require 'spec_helper'

describe BleatsHelper do
  describe "#linkify_tag" do
    it "returns a link for the given tag" do
      linky = link_to "#winning", controller: 'bleats', action: 'trending', tag: "#winning"
      expect(helper.linkify_tag "#winning").to eq(linky)
    end
  end
  
  describe "#linkify_content" do
    it "returns the content of a bleat with the hashtags linkified" do
      linky = link_to "#winning", controller: 'bleats', action: 'trending', tag: "#winning"
      expect(helper.linkify_content "lol #winning").to eq("lol #{linky}")
    end
  end
end

