#!/usr/bin/env ruby
 
require 'rubygems'
require 'selenium-webdriver'
 
driver = Selenium::WebDriver.for :firefox
driver.navigate.to "http://www.google.com"
element = driver.find_element(:name, 'q')
element.send_keys "BrowserStack"
element.submit
puts driver.title # prints out 'BrowserStack - Google Search'
driver.quit # This is important

