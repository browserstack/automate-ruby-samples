require 'rubygems'
require 'minitest/autorun'
require 'selenium-webdriver'
require 'json'

class ParallelMinitest < MiniTest::Test
  USERNAME = ENV['BROWSERSTACK_USERNAME'] || ''
  BROWSERSTACK_ACCESS_KEY = ENV['BROWSERSTACK_ACCESS_KEY'] || ''

  def setup
    if USERNAME == ''
      puts 'Please add BROWSERSTACK_USERNAME & BROWSERSTACK_ACCESS_KEY to environment or in this file'
      exit
    end
    url = "https://#{USERNAME}:#{BROWSERSTACK_ACCESS_KEY}@hub.browserstack.com/wd/hub"
    capabilities = JSON.parse(ARGV[0])
    @driver = Selenium::WebDriver.for(:remote,
                                      url: url,
                                      desired_capabilities: capabilities)
  end

  def test_post
    @driver.navigate.to 'https://www.google.com/ncr'
    element = @driver.find_element(:name, 'q')
    element.send_keys 'BrowserStack'
    element.submit
    assert_equal(@driver.title, 'BrowserStack - Google Search')
  end

  def test_parallel
    expected_contents = ''
    @driver.get 'https://www.keyboardtester.com/tester.html'
    editor = @driver.find_element :id, 'testarea'
    25.times do
      key = (('a'...'z').to_a + ('A'...'Z').to_a).sample
      expected_contents << key
      editor.send_keys key
      actual_contents = editor.attribute('value')
      raise "Incorrect insertion. Expected: #{expected_contents}\nActual: #{actual_contents}" unless actual_contents == expected_contents
    end
  end

  def teardown
    @driver.quit
  end
end
