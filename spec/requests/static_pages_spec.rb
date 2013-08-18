require 'spec_helper'

describe "Static pages" do

  let(:base_title) {"Rails tutorial"}
  subject {page}

  describe "Home page" do
    before{visit root_path}
    it {should have_selector('h1', text: 'Sample App')}
  end

  describe "Help page" do
    before{visit help_path}
    it {should have_content('Help page')}
    it {should have_selector('title', :text => "#{base_title} - Help")}
  end

  describe "About Us" do
    before {visit about_path}
    it {should have_content('About Us')}
    it {should have_selector('title', :text => "#{base_title} - About")}
  end

  describe "Contact Us" do
    before {visit contact_path}
    it {should have_content('Contact Us')}
    it {should have_selector('title', :text => "#{base_title} - Contact")}
  end
end