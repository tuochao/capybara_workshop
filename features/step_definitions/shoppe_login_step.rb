require_relative '../../spec/spec_helper'
require_relative '../../spec/pages/shoppe_home_page'
require_relative '../../spec/pages/shoppe_login_page'

page = Capybara.current_session
Given /^I open shoppe home page$/ do
  @shoppe_home_page = ShoppeHomePage.new
  @shoppe_home_page.load
  page.driver.browser.manage.window.resize_to(1440,900)
end

When /^I click login link$/ do
  @shoppe_home_page.login
end

Then /^should display login page$/ do
  expect(page.current_path).to eq('/shoppe/login')
end

When /^I input username and password$/ do
  @shoppe_login_page = ShoppeLoginPage.new
  @shoppe_login_page.input_username('admin@example.com')
  @shoppe_login_page.input_password('password')
end

And /^click login button$/ do
  @shoppe_login_page.login
end

Then /^I should login successfully$/ do
  expect(page.current_path).to eq('/shoppe/orders')
end