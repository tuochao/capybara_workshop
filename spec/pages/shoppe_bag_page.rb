class ShoppeBagPage < SitePrism::Page
  set_url 'http://localhost:3000/basket'
  element :first_item_delete_button, 'body > section > div > section.primary > div > table > tbody > tr:nth-child(1) > td.product > a'
  element :second_item_delete_button, 'body > section > div > section.primary > div > table > tbody > tr:nth-child(2) > td.product > a'
  elements :all_items, 'body > section > div > section.primary > div > table > tbody > tr'

  def get_item_count
    all_items.length
  end

  def remove_first_item
    first_item_delete_button.click
  end

  def remove_all_items
    item_count = get_item_count
    for i in 0...item_count
      remove_first_item
    end
  end
end