require 'spec_helper'
require_relative '../pages/google_search_page'

describe "google.co.uk",  :type => :feature do

  context "the page" do

    before do
      @goole_search_page = GoogleSearch.new
		  @goole_search_page.load
      page.driver.browser.manage.window.resize_to(1440,900) #Mention it here
      visit "/"

    end

    it "contains a search button" do
     @goole_search_page.search_for('capybara')
     sleep(10)
    end


  end

end
