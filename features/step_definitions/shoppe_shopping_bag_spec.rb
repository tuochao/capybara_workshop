require_relative '../../spec/spec_helper'
require_relative '../../spec/pages/shoppe_home_page'
require_relative '../../spec/pages/shoppe_bag_page'

page = Capybara.current_session

When /^I add Yealink T20P into bag$/ do
  @shoppe_home_page = ShoppeHomePage.new
  @shoppe_home_page.add_yealink_t20p
end

And /^I add Yealink T46GN into bag$/ do
  @shoppe_home_page.add_yealink_t46gn
end

And /^I open my bag$/ do
  @shoppe_bag_page = ShoppeBagPage.new
  @shoppe_bag_page.load
end

Then /^I should see two items in my bag$/ do
  expect(@shoppe_bag_page.get_item_count).to eq 2
end

When /^I remove first item from my bag$/ do
  @shoppe_bag_page.remove_first_item
end

Then /^I should see only one items in my bag$/ do
  @shoppe_bag_page.wait_until_second_item_delete_button_invisible
  expect(@shoppe_bag_page.get_item_count).to eq 1
end

When /^I remove all items from my bage$/ do
  @shoppe_bag_page.remove_all_items
end

Then /^should jump back to home page$/ do
  @shoppe_home_page.wait_until_login_link_visible
  expect(page.current_path).to eq '/'
end