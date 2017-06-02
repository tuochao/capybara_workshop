require_relative 'shoppe_products_section'

class ShoppeHomePage < SitePrism::Page
  set_url 'http://localhost:3000'
  element :login_link, 'body > div > div > ul > li:nth-child(1) > a'
  element :view_bag_button, 'body > section > div > section.sidebar > div > p.buttons > a:nth-child(1)'
  section :products_section, ShoppeProductSection, 'body > section > div > section.primary > ul.products'

  def login
    login_link.click
  end

  def add_yealink_t20p
    products_section.yealink_t20p_add_button.click
  end

  def add_yealink_t46gn
    products_section.yealink_t46gn_add_button.click
  end

  def open_my_bag
    view_bag_button.click
  end

end