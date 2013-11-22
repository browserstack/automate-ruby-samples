require 'selenium/webdriver'

url = "http://#{ENV['BS_USERNAME']}:#{ENV['BS_AUTHKEY']}@hub.browserstack.com/wd/hub"

capabilities['project'] = ENV['BS_AUTOMATE_PROJECT'] if ENV['BS_AUTOMATE_PROJECT']
capabilities['build'] = ENV['BS_AUTOMATE_BUILD'] if ENV['BS_AUTOMATE_BUILD']

capabilities = Selenium::WebDriver::Remote::Capabilities.new
capabilities['os'] = ENV['BS_AUTOMATE_OS']
capabilities['os_version'] = ENV['BS_AUTOMATE_OS_VERSION']
capabilities['browser'] = ENV['SELENIUM_BROWSER']
capabilities['browser_version'] = ENV['SELENIUM_VERSION']

browser = Selenium::WebDriver.for(:remote, :url => url,
                                  :desired_capabilities => capabilities)

Before do |scenario|
  @browser = browser
end

at_exit do
  browser.quit
end
