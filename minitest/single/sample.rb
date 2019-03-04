require 'rubygems'
require 'minitest/autorun'
require 'selenium-webdriver'

class GoogleTest < MiniTest::Test
  USERNAME = ENV['BROWSERSTACK_USERNAME'] || ''
  BROWSERSTACK_ACCESS_KEY = ENV['BROWSERSTACK_ACCESS_KEY'] || ''

  def setup
    if USERNAME == ''
      puts 'Please add USERNAME & BROWSERSTACK_ACCESS_KEY to environment or in this file'
      exit
    end
    url = "https://#{USERNAME}:#{BROWSERSTACK_ACCESS_KEY}@hub.browserstack.com/wd/hub"
    capabilities = {
      'browserName' => 'Firefox',
      'browserVersion' => '65.0',
      'browserstack.use_w3c' => true,
      'bstack:options' => {
        'os' => 'Windows',
        'buildName' => 'automate-ruby-samples',
        'osVersion' => '10',
        'sessionName' => 'single_test',
        'projectName' => 'Sample project',
        'debug' => true
      }
    }
    
    @driver = Selenium::WebDriver.for(
      :remote,
      url: "https://#{USERNAME}:#{BROWSERSTACK_ACCESS_KEY}@hub.browserstack.com/wd/hub",
      desired_capabilities: capabilities
    )
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
