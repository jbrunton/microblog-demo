require 'spec_helper'

describe BleatsController do
  describe "POST create" do
    let(:user) { create(:user) }
  
    before do
      sign_in user
    end
    
    it "builds a new bleat" do
      subject.current_user.bleats.should_receive(:build).
        with("content" => "Howdy!")
      post :create, :bleat => { :content => "Howdy!" }
    end
    
    context "when the bleat saves successfully" do
      it "redirects to the user's profile" do
        post :create, :bleat => { :content => "Howdy!" }
        response.should redirect_to(subject.current_user)
      end
    end
    
    context "when the bleat fails to save" do
      it "renders the new template" do
        post :create, :bleat => { :content => "" }
        response.should render_template("new")
      end
    end
  end
end
