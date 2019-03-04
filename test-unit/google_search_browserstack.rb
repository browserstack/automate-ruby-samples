require 'rubygems'
require 'selenium-webdriver'
require 'test/unit'

# sample ruby test class
class SampleTest < Test::Unit::TestCase
  USERNAME = ENV['BROWSERSTACK_USERNAME'] || ''
  BROWSERSTACK_ACCESS_KEY = ENV['BROWSERSTACK_ACCESS_KEY'] || ''

  def setup
    if USERNAME == ''
      puts 'Please add BROWSERSTACK_USERNAME & BROWSERSTACK_ACCESS_KEY to your environment variables or in this file'
      exit
    end
    url = "https://#{USERNAME}:#{BROWSERSTACK_ACCESS_KEY}@hub.browserstack.com/wd/hub"
    @driver = Selenium::WebDriver.for(:remote, url: url)
  end

  def test_post
    @driver.navigate.to 'https://www.google.com/ncr'
    element = @driver.find_element(:name, 'q')
    element.send_keys 'BrowserStack'
    element.submit
    assert_equal(@driver.title, 'BrowserStack - Google Search')
  end

  def teardown
    @driver.quit
  end
end
