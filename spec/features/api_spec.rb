require 'spec_helper'

describe 'practise capybara api',  :type => :feature do
  session = Capybara::Session.new(:selenium)
  before :all do
    # session.visit('http://www.google.com')
  end

  it 'should open web driver' do
    session.visit('http://www.google.com')
  end

  it 'put current title and url' do
    # Reference:http://www.rubydoc.info/github/teamcapybara/capybara/master/Capybara/Session
    puts session.title
    puts session.current_url
    puts session.current_path
  end

  it 'navigat forward and back' do
    # Reference:http://www.rubydoc.info/github/teamcapybara/capybara/master/Capybara/Session
    session.visit('http://www.baidu.com')
    puts session.title
    session.go_back
    puts session.title
    session.go_forward
    puts session.title
  end

  it 'simple locate element' do
    # Reference:http://www.rubydoc.info/github/teamcapybara/capybara/master/Capybara/Node/Finders
    # find by id
    file_path =  'file://' + File.expand_path('../../../html/form_locate.html', __FILE__)
    session.visit(file_path)
    puts session.find_by_id('inputEmail').click

    # find field
    puts session.find_field('inputEmail').click
    puts session.find_field('password').click

    # find link
    puts session.find_link('register')

    # find button
    puts session.find_button('Sign in')

    # find by css selector
    element = session.find(:css, '#inputEmail')
    session.execute_script('$(arguments[0]).fadeOut().fadeIn()', element)
    sleep 3

    element = session.find(:css, '.btn')
    session.execute_script('$(arguments[0]).fadeOut().fadeIn()', element)
    sleep 3

    # find by xpath
    element = session.find(:xpath, '/html/body/form/div[3]/div/button')
    session.execute_script('$(arguments[0]).fadeOut().fadeIn()', element)
    sleep 3
  end

  it 'locate a group of elements' do
    # Reference:http://www.rubydoc.info/github/teamcapybara/capybara/master/Capybara/Node/Finders
    file_path =  'file://' + File.expand_path('../../../html/checkbox.html', __FILE__)
    session.visit(file_path)

    puts session.all(:css, 'input[type=checkbox]').length
    session.all(:css, 'input[type=checkbox]').each do |element|
      puts element.checked?
    end
  end

  it 'locate element by level' do
    file_path =  'file://' + File.expand_path('../../../html/level_locate.html', __FILE__)
    session.visit(file_path)

    session.find_link('Link1').click
    sleep 2
    menu = session.find_by_id('dropdown1').find_link('Another action')
    puts menu.text
  end

  it 'interaction with element' do
    # Reference:http://www.rubydoc.info/github/teamcapybara/capybara/master/Capybara/Node/Actions
    session.visit('http://www.baidu.com')

    # click
    session.click_link('新闻')
    sleep 2
    session.go_back
    sleep 1

    # hover
    session.find_link('设置').hover
    sleep 2

    # input
    session.fill_in('wd', with: 'selenium webdriver')
    session.click_button('su')
    sleep 2

    # check
    file_path =  'file://' + File.expand_path('../../../html/checkbox.html', __FILE__)
    session.visit(file_path)

    session.check('checkbox1')
    sleep 1
    session.check('checkbox2')
    sleep 1
    session.check('checkbox3')
    sleep 1
  end

  it 'querying' do
    # Reference:http://www.rubydoc.info/github/teamcapybara/capybara/master/Capybara/Node/Matchers
    session.visit('http://localhost:3000')
    expect(session.has_text?('Welcome to our shoppe')).to be_truthy
    expect(session).to have_text('Welcome to our shoppe')

    expect(session.has_link?('Play with Shoppe Admin')).to be_truthy
    expect(session).to have_link('Play with Shoppe Admin')

    expect(session.has_css?('.bar')).to be_truthy
    expect(session).to have_css('.bar')
  end

  it 'status of element' do
    # Reference: http://www.rubydoc.info/github/teamcapybara/capybara/master/Capybara/Node/Element
    file_path =  'file://' + File.expand_path('../../../html/form.html', __FILE__)
    session.visit(file_path)

    puts session.find(:css, '.checkbox').checked?
    puts session.find(:css, '.radio').selected?

    button = session.find_button('submit')
    puts button.value
    puts button.text
    puts button.disabled?
    puts button.visible?

    sleep 2
    button.hover
    sleep 2
    button.click
    sleep 2

  end

end