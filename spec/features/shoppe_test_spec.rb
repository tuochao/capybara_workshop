require 'spec_helper'
require_relative '../pages/shoppe_bag_page'
require_relative '../pages/shoppe_home_page'
require_relative '../pages/shoppe_login_page'

describe 'test for shoppe', :type => :feature do
  before do
    @shoppe_home_page = ShoppeHomePage.new
    @shoppe_login_page = ShoppeLoginPage.new
    @shoppe_bag_page = ShoppeBagPage.new
    @shoppe_home_page.load
    puts page
    page.driver.browser.manage.window.resize_to(1440,900) #Mention it here
  end

  context 'login from shoppe home page' do
    before do
      @shoppe_home_page.login
      @shoppe_login_page.input_username('admin@example.com')
      @shoppe_login_page.input_password('password')
      @shoppe_login_page.login
      sleep 2
    end

    it 'should login successfully' do
      expect(page.current_path).to eq('/shoppe/orders')
    end
  end
end