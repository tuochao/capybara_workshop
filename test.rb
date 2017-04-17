require 'capybara'
require 'selenium-webdriver'
require 'capybara/dsl'
Capybara.run_server = false
Capybara.default_driver=:selenium
Capybara.app_host = 'http://www.google.com'


include Capybara::DSL
# include Capybara::RSpecMatchers

module MyCapybaraTest
  class Test
    include Capybara::DSL
    def test_google
      visit('/')
    end
  end
end

t = MyCapybaraTest::Test.new
t.test_google
