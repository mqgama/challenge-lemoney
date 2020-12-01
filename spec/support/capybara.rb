require 'capybara/rspec'
require 'webdrivers/chromedriver'

Capybara.register_driver :chrome_headless do |app|
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
    'goog:chromeOptions': {
      args: %w[ no-sandbox headless disable-popup-blocking disable-gpu window-size=1280,1024 disable-dev-shm-usage ]
    }
  )

  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    desired_capabilities: capabilities
  )
end

Capybara.javascript_driver = :chrome_headless
Capybara.default_max_wait_time = 5
Capybara.server = :puma, { Silent: true }
