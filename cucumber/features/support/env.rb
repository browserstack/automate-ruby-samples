require 'selenium/webdriver'

url = "https://#{ENV['BROWSERSTACK_USERNAME']}:#{ENV['BROWSERSTACK_ACCESS_KEY']}@hub.browserstack.com/wd/hub"

capabilities = Selenium::WebDriver::Remote::Capabilities.new

capabilities['project'] = ENV['BS_AUTOMATE_PROJECT'] if ENV['BS_AUTOMATE_PROJECT']
capabilities['build'] = ENV['BS_AUTOMATE_BUILD'] if ENV['BS_AUTOMATE_BUILD']

if ENV['BS_AUTOMATE_OS']
  capabilities['os'] = ENV['BS_AUTOMATE_OS']
  capabilities['os_version'] = ENV['BS_AUTOMATE_OS_VERSION']
else
  capabilities['platform'] = ENV['SELENIUM_PLATFORM'] || 'ANY'
end

capabilities['browser'] = ENV['SELENIUM_BROWSER'] || 'chrome'
capabilities['browser_version'] = ENV['SELENIUM_VERSION'] if ENV['SELENIUM_VERSION']

browser = Selenium::WebDriver.for(:remote, url: url, desired_capabilities: capabilities)

Before do |_scenario|
  @browser = browser
end

at_exit do
  browser.quit
end
