require 'spec_helper'

describe "UserPages" do
  subject {page} #sets what we are going to test against
  describe "Signup Page" do
    before {visit signup_path} #load the page to test
    it {should have_selector("title", title: full_title('Sign up'))}
    
    it {should have_selector('h1', text:'Sign up')}
    
  end
end
