#!/usr/bin/env ruby
 
require 'rubygems'
require 'selenium-webdriver'

selenium_host = ENV['SELENIUM_HOST'] || 'localhost'
selenium_port = ENV['SELENIUM_PORT'] || '4444'
selenium_platform = ENV['SELENIUM_PLATFORM'] || 'ANY'
selenium_browser = ENV['SELENIUM_BROWSER'] || 'chrome'
selenium_browser_version = ENV['SELENIUM_VERSION']

bs_username = ENV['BS_USERNAME']
bs_key = ENV['BS_AUTHKEY']
bs_project = ENV['BS_AUTOMATE_PROJECT']
bs_build = ENV['BS_AUTOMATE_BUILD']

url = "http://" + selenium_host + ":" + selenium_port + "/wd/hub"
puts "Testing selenium with hub " + url

capabilities = Selenium::WebDriver::Remote::Capabilities.new
capabilities['platform'] = selenium_platform
capabilities['browserName'] = selenium_browser
capabilities['version'] = selenium_browser_version
capabilities['browserstack.user'] = bs_username
capabilities['browserstack.key'] = bs_key
capabilities['project'] = bs_project
capabilities['build'] = bs_build

driver = Selenium::WebDriver.for(:remote, :url => url, :desired_capabilities => capabilities)

driver.navigate.to "http://www.google.com"
element = driver.find_element(:name, 'q')
element.send_keys "BrowserStack"
element.submit
puts driver.title
driver.quit

