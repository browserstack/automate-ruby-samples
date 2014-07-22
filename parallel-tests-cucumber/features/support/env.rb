require 'selenium/webdriver'

url = "http://#{ENV['BS_USERNAME']}:#{ENV['BS_AUTHKEY']}@hub.browserstack.com/wd/hub"

capabilities = Selenium::WebDriver::Remote::Capabilities.new
capabilities['os'] = ENV['BS_AUTOMATE_OS'] if ENV["BS_AUTOMATE_OS"]
capabilities['os_version'] = ENV['BS_AUTOMATE_OS_VERSION'] if ENV["BS_AUTOMATE_OS_VERSION"]
capabilities['browser'] = ENV['SELENIUM_BROWSER'] if ENV["SELENIUM_BROWSER"]
capabilities['browser_version'] = ENV['SELENIUM_VERSION'] if ENV["SELENIUM_VERSION"]
capabilities['browserstack.debug'] = "true"
capabilities['project'] = ENV['BS_AUTOMATE_PROJECT'] if ENV['BS_AUTOMATE_PROJECT']
capabilities['build'] = ENV['BS_AUTOMATE_BUILD'] if ENV['BS_AUTOMATE_BUILD']
capabilities['platform'] = ENV['BS_AUTOMATE_PLATFORM'] if ENV["BS_AUTOMATE_PLATFORM"]
capabilities['device'] = ENV['BS_AUTOMATE_DEVICE'] if ENV["BS_AUTOMATE_DEVICE"]
capabilities['browserName'] = ENV['BS_AUTOMATE_BROWSER_NAME'] if ENV["BS_AUTOMATE_BROWSER_NAME"]           
browser = Selenium::WebDriver.for(:remote, :url => url,
                                  :desired_capabilities => capabilities)

Before do |scenario|
  @browser = browser
end

at_exit do
  browser.quit
end
