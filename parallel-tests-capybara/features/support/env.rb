require 'selenium/webdriver'

url = "http://#{ENV['username']}:#{ENV['key']}@hub.browserstack.com/wd/hub"

capabilities = Selenium::WebDriver::Remote::Capabilities.new
capabilities['os'] = ENV['OS']
capabilities['os_version'] = ENV['OS_VERSION']
capabilities['browser'] = ENV['BROWSER']
capabilities['browser_version'] = ENV['BROWSER_VERSION']

browser = Selenium::WebDriver.for(:remote, :url => url,
                                  :desired_capabilities => capabilities)

Before do |scenario|
  @browser = browser
end

After do |scenario|
  @browser.quit
end
