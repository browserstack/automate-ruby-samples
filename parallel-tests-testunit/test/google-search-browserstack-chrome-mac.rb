require 'rubygems'
require 'selenium-webdriver'
require 'test/unit'
 
class SampleTest1 < Test::Unit::TestCase
  def setup
    username=ENV['BS_USERNAME']
    key=ENV['BS_AUTHKEY']
    url = "http://#{username}:#{key}@hub.browserstack.com/wd/hub"
    capabilities = Selenium::WebDriver::Remote::Capabilities.chrome
    capabilities.platform = :MAC
    @driver = Selenium::WebDriver.for(:remote, :url => url,  :desired_capabilities => capabilities)
  end
 
  def test_post
    @driver.navigate.to "http://www.google.com"
    element = @driver.find_element(:name, 'q')
    element.send_keys "BrowserStack"
    element.submit
    assert_equal(@driver.title, "BrowserStack - Google Search")
  end
 
  def teardown
    @driver.quit
  end
end
