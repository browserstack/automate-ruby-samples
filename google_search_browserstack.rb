#!/usr/bin/env ruby

require 'rubygems'
require 'selenium-webdriver'

USERNAME = ENV['BROWSERSTACK_USERNAME'] || ''
BROWSERSTACK_ACCESS_KEY = ENV['BROWSERSTACK_ACCESS_KEY'] || ''
if USERNAME == ''
  puts 'Please add BROWSERSTACK_USERNAME & BROWSERSTACK_ACCESS_KEY to your environment variables or in this file'
  exit
end
driver = Selenium::WebDriver.for(
  :remote,
  url: "https://#{USERNAME}:#{BROWSERSTACK_ACCESS_KEY}@hub.browserstack.com/wd/hub",
  desired_capabilities: Selenium::WebDriver::Remote::Capabilities.firefox
)

driver.navigate.to 'http://www.google.com'
element = driver.find_element(:name, 'q')
element.send_keys 'BrowserStack'
element.submit
puts driver.title
driver.quit
