
require_relative '../pages/google_search_section'

class GoogleSearch < SitePrism::Page
  set_url '/'
  # set_url_matcher(/test\.html$/)
  element :search_value,      "#lst-ib"
  section :search_bar,SearchSection , ".tsf-p .jsb "

  def search_for(query)
    search_value.set(query)
    search_bar.search_button.click
  end
end
