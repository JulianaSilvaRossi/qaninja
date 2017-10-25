require 'capybara'
require 'capybara/cucumber'
require 'rspec'
require 'selenium-webdriver'
require 'site_prism'
require 'faker'

require_relative 'page_object'

World(PageObjects)

Faker::Config.locale = 'pt-BR'

Capybara.configure do |config|
    config.default_driver = :selenium
    config.app_host = 'https://ninjainvoices.herokuapp.com'
end

Capybara.default_max_wait_time = 10