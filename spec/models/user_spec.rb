require 'spec_helper'

describe User do
  it "should require an email" do
    user = User.new(:email => "")
    expect(user).not_to be(true)
  end
end
