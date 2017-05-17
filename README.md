# capybara_workshop session2
## page object
site_prism
update your gemfile
add gem "site_prism" into your gemfile

```
gem "site_prism"

```
### page
create pages class
 please notice  class name must be used capital
```

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

```
#### core for site_prism
    1.  section
    2.  pages
    3.  element/elements

please check site_prism details documentation

how to run test
```
rspec
```
