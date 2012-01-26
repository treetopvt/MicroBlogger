require 'spec_helper'

describe "Static Pages" do

  let(:base_title) { "MicroBlogger Sample Application |" }

  describe "Home page" do
    subject {page}
    before { visit root_path }
    it{ should have_selector('title', title: full_title('Home'))}
    
    it{ should have_selector('h1', :text=>"Sample App")}
    
  end

  describe "Help page" do
    subject {page}
    before {visit help_path}
    it{ should have_selector('title', title: full_title('Help'))}
      
    it {should have_selector('h1', :text=>"Help")}
    
  end

  describe "About Page" do
    subject {page}
    before {visit about_path}
    it{ should have_selector('title', title: full_title('About Us'))}
    
    it{ should have_selector('h1', :text=>"About Us")}
    
  end

  describe "Contact Page" do
    subject {page} #replaces all instances of page.should, etc....
    before {visit contact_path} #navigate to the page before performing any tests
    it{ should have_selector('title', title: full_title('Contact'))}  #replaces the it "text description" with actual test, still readable
    
    it{ should have_selector('h1', :text=>"Contact")}
    
  end

end

