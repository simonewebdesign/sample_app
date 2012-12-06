require 'spec_helper'

describe "StaticPages" do

  let(:base_title) { "Ruby on Rails Tutorial Sample App" }

  describe "Home page" do
    it "should have the content 'Home page'" do
      visit '/static_pages/home'
      page.should have_selector('h1', text: 'Home')
    end
    it "should have the right title" do
      visit '/static_pages/home'
      page.should have_selector('title', text: "Home | #{base_title}")
    end
  end
  describe "Help page" do
    it "should have the content 'Help'" do
      visit '/static_pages/help'
      page.should have_selector('h1', text: 'Help')
    end
    it "should have the right title" do
      visit '/static_pages/help'
      page.should have_selector('title', text: "Help | #{base_title}")
    end    
  end
  describe "About page" do
    it "should have the content 'About Us'" do
      visit '/static_pages/about'
      page.should have_selector('h1', text: 'About Us')
    end
    it "should have the right title" do
      visit '/static_pages/about'
      page.should have_selector('title', text: "About Us | #{base_title}")
    end    
  end
  describe "Contact page" do
    it "should have the content 'Contact Us'" do
      visit '/static_pages/contact'
      page.should have_selector('h1', text: 'Contact Us')
    end
    it "should have the right title" do
      visit '/static_pages/contact'
      page.should have_selector('title', text: "Contact Us | #{base_title}")
    end    
  end  
end
