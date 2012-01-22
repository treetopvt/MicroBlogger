require 'spec_helper'

describe "Static Pages" do
  describe "Home page" do
    it "Should the right title" do
      visit '/static_pages/home'
      page.should have_selector('title', :text=>"| Home")
    end
    
    it "should have the h1 'Sample App'" do
      visit '/static_pages/home'
      page.should have_selector('h1', :text=>"Sample App")
    end
  end
  
  describe "Help page" do
    it "Should the right title" do
      visit '/static_pages/help'
      page.should have_selector('title', :text=>"| Help")
      page.should have_selector('h1', :text=>"Help")
    end
  end
  
  describe "About Page" do
    it "should have the right title and h1 'About Us'" do
      visit '/static_pages/about'
      page.should have_selector('title', :text=>"| About Us")
      page.should have_selector('h1', :text=>"About Us")
    end
  end
end

