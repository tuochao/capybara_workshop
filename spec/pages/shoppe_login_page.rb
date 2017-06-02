class ShoppeLoginPage < SitePrism::Page
  set_url 'http://localhost:3000/shoppe/login'
  element :username_field, '#email_address'
  element :password_field, '#password'
  element :login_button, '#content > div > form > p.submit > input'

  def input_username(username)
    username_field.set(username)
  end

  def input_password(password)
    password_field.set(password)
  end

  def login
    login_button.click
  end
end