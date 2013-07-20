require 'selenium/webdriver'

url = "http://#{ENV['username']}:#{ENV['key']}@hub.browserstack.com/wd/hub"

capabilities = Selenium::WebDriver::Remote::Capabilities.new
if ENV['OS']
  capabilities['os'] = ENV['os']
  capabilities['os_version'] = ENV['os_version']
else
  capabilities['platform'] = ENV['platform'] || 'ANY'
end
if ENV['BROWSER']
  capabilities['browser'] = ENV['browser']
else
  capabilities['browserName'] = ENV['browser'] || 'chrome'
end
capabilities['browser_version'] = ENV['browser_version'] if ENV['browser_version']

browser = Selenium::WebDriver.for(:remote, :url => url, :desired_capabilities => capabilities)

Before do |scenario|
  @browser = browser
end

After do |scenario|
  @browser.quit
end
