require "spec_helper"

describe "shared/_menu.html.erb" do

  context "when the current user is not authenticated" do
    it "includes a 'Sign in' link" do
      render
      rendered.should have_link('Sign in', :href => new_user_session_path)
    end
    
    it "includes a 'Sign in as' menu" do
      render
      rendered.should have_link('Sign in with')
    end
    
    it "includes a link to sign in with each provider" do
      render
      rendered.should have_link('Developer', user_omniauth_authorize_path(:developer))
    end
  end
  
  context "when the current user is authenticated" do
    let(:user) { create(:user) }
    before(:each) do
      sign_in user
    end
    
    it "includes a 'Sign out' link" do
      render
      rendered.should have_link('Sign out', :href => destroy_user_session_path)
    end
    
    it "includes a 'Welcome' link" do
      render
      rendered.should have_link('Welcome', :href => user_path(user))
    end
    
    it "includes a 'Compose' link" do
      render
      rendered.should have_link('Compose', :href => new_bleat_path)
    end
    
    context "when the current user is an admin" do
      it "includes an 'Admin' link" do
        view.current_user.stub(:admin?) { true }
        render
        rendered.should have_link('Admin', "/admin")
      end
    end
    
    context "when the current user is not an admin" do
      it "does not include an 'Admin' link" do
        view.current_user.stub(:admin?) { false }
        render
        rendered.should_not have_link('Admin')
      end
    end
  end

end
