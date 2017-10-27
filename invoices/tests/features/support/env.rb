require 'capybara'
require 'capybara/cucumber'
require 'capybara/poltergeist'
require 'rspec'
require 'selenium-webdriver'
require 'site_prism'
require 'faker'

require_relative 'page_object'

World(PageObjects)

Faker::Config.locale = 'pt-BR'

$browser = ENV['BROWSER']

Capybara.register_driver :selenium do |app|

    if $browser.eql?('chrome')
        #subir Chrome
        Capybara::Selenium::Driver.new(
            app,
            browser: :chrome,
            desired_capabilities: Selenium::WebDriver::Remote::Capabilities.chrome(
                'chromeOption' => {
                    'args' => ['windows-size=1280,800']
                }
            )
        )

    elsif $browser.eql?('firefox')
        #subir Firefox
        Capybara::Selenium::Driver.new(
            app,
            browser: :firefox,
            marionette: true
        )

    elsif $browser.eql?('headless')
        #subir phantonjs + poltergeist
        Capybara::Poltergeist::Driver.new(
            app,
            options = {
                :js_errors => false
            }
        )
    end
end

Capybara.configure do |config|
    config.default_driver = :selenium
    config.app_host = 'https://ninjainvoices.herokuapp.com'
end

Capybara.default_max_wait_time = 10