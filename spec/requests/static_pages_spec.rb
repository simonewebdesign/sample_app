require 'spec_helper'

describe "StaticPages" do
  describe "Home page" do
    it "should have the content 'Home page'" do
      visit '/static_pages/home'
      page.should have_selector('h1', text: 'Home')
    end
    it "should have the right title" do
      visit '/static_pages/home'
      page.should have_selector('title', text: "Home | Ruby on Rails Tutorial Sample App")
    end
  end
  describe "Help page" do
    it "should have the content 'Help'" do
      visit '/static_pages/help'
      page.should have_selector('h1', text: 'Help')
    end
    it "should have the right title" do
      visit '/static_pages/help'
      page.should have_selector('title', text: "Help | Ruby on Rails Tutorial Sample App")
    end    
  end
  describe "About page" do
    it "should have the content 'About Us'" do
      visit '/static_pages/about'
      page.should have_selector('h1', text: 'About Us')
    end
    it "should have the right title" do
      visit '/static_pages/about'
      page.should have_selector('title', text: "About Us | Ruby on Rails Tutorial Sample App")
    end    
  end
end
