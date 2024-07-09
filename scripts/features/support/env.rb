require 'capybara/cucumber'
require 'capybara'
require 'selenium-webdriver'
require 'capybara/rspec'
# require 'capybara-screenshot/cucumber'


Capybara.configure do |config|
  # config.default_driver = :selenium
  config.app_host = 'https://www.adset.com.br'
  config.default_max_wait_time = 10
end


Capybara.register_driver :selenium do |app|
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
    "goog:chromeOptions" => {
      "args" => ["--disable-popup-blocking", "--disable-infobars"]
    }
  )
  
  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    capabilities: capabilities
  )
end

Capybara.default_driver = :selenium


