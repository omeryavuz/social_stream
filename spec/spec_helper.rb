# Configure Rails Envinronment
ENV["RAILS_ENV"] ||= "test"
ENV["RAILS_ENV"] = "#{ ENV["RAILS_ENV"] }_#{ ENV['DB'] }" if ENV['DB']

require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require "rspec/rails"

ActionMailer::Base.delivery_method = :test
ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.default_url_options[:host] = "test.com"

Rails.backtrace_cleaner.remove_silencers!

# Configure capybara for integration testing
require "capybara/rails"
Capybara.default_driver   = :rack_test
Capybara.default_selector = :css

# FIXME orm
ActiveRecord::Migration.verbose = false

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

# Load Factories
require 'factory_girl'
Dir["#{File.dirname(__FILE__)}/factories/*.rb", "#{File.dirname(__FILE__)}/../*/spec/factories/*.rb"].each {|f| require f}
