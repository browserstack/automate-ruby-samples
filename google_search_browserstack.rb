#!/usr/bin/env ruby

require 'rubygems'
require 'selenium-webdriver'

USERNAME = ENV['BROWSERSTACK_USERNAME'] || ''
BROWSERSTACK_ACCESS_KEY = ENV['BROWSERSTACK_ACCESS_KEY'] || ''

if USERNAME == ''
  puts 'Please add BROWSERSTACK_USERNAME & BROWSERSTACK_ACCESS_KEY to your environment variables or in this file'
  exit
end

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

driver = Selenium::WebDriver.for(
  :remote,
  url: "http://#{USERNAME}:#{BROWSERSTACK_ACCESS_KEY}@hub.browserstack.com/wd/hub",
  desired_capabilities: capabilities
)

driver.navigate.to 'http://www.google.com'
element = driver.find_element(:name, 'q')
element.send_keys 'BrowserStack'
element.submit
puts driver.title
driver.quit
