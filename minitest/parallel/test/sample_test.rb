require 'rubygems'
require 'minitest/autorun'
require 'selenium-webdriver'

class GoogleTest < MiniTest::Test
  USERNAME = ENV['username']
  BROWSERSTACK_ACCESS_KEY = ENV['key']
  
  def setup
    if USERNAME == ''
      puts "Please add username & key as parameters while running rake task"
      exit
    end
    url = "http://#{USERNAME}:#{BROWSERSTACK_ACCESS_KEY}@hub.browserstack.com/wd/hub"
    capabilities = Selenium::WebDriver::Remote::Capabilities.new
    capabilities['os'] = ENV['OS']
    capabilities['os_version'] = ENV['OS_VERSION']
    capabilities['browser'] = ENV['BROWSER']
    capabilities['browser_version'] = ENV['BROWSER_VERSION']
    @driver = Selenium::WebDriver.for(:remote, 
                                      :url => url,
                                      :desired_capabilities => capabilities)
  end
 
  def test_post
    @driver.navigate.to "http://www.google.com"
    element = @driver.find_element(:name, 'q')
    element.send_keys "BrowserStack"
    element.submit
    assert_equal(@driver.title, "BrowserStack - Google Search")
  end

  def test_parallel
    expected_contents = ""
    @driver.get "http://fu.browserstack.com/browserstack_demo.html"
    editor = @driver.find_element :id, "editor"
    50.times do |cc|
      puts cc
      expected_contents << "a"
      editor.send_keys "a"
      actual_contents = @driver.execute_script "return document.getElementById('editor').value"
      raise "Incorrect insertion. Expected: #{expected_contents}\nActual: #{actual_contents}" unless actual_contents == expected_contents
    end
  end
 
  def teardown
    @driver.quit
  end
end
