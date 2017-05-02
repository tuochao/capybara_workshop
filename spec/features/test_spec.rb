describe "google.co.uk",  :type => :feature do

  context "the page" do

    before do
      page.driver.browser.manage.window.resize_to(1440,900) #Mention it here
      visit "/"

    end

    it "contains a search button" do
      expect(page).to have_button "Google Search"
    end

    it "has feeling lucky button" do
      expect(page).to have_button "I'm Feeling Lucky"
    end

    it "has a search box" do
      expect(page).to have_field('q', :type => 'text')
    end

  end

  context "doing a search for pixie labs on twitter" do
    before do
      visit "/"
      fill_in 'q', :with => 'pixie labs twitter'

      # no button to click now that google auto-starts the search
      # click_button "Google Search"
    end

    it "should return search results" do
      expect(page).to have_text "results"
    end

    it "should list the pixielabs twitter page" do
      expect(page).to have_text "Pixie Labs (pixielabs) on Twitter"
    end

  end

end
