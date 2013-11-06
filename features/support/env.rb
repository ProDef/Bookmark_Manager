# Generated by cucumber-sinatra. (2013-11-04 14:03:00 +0000)

ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', '..', 'lib/bookmarker.rb')

require 'capybara'
require 'capybara/cucumber'
require 'rspec'
require 'database_cleaner'

Capybara.app = Bookmarker
DatabaseCleaner.strategy = :truncation

class BookmarkerWorld
  include Capybara::DSL
  include RSpec::Expectations
  include RSpec::Matchers
end

World do
  BookmarkerWorld.new
end

Before do
  DatabaseCleaner.start
end

After do |scenario|
  DatabaseCleaner.clean
end