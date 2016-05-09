ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/autorun'
require 'minitest/pride'
require 'capybara/rails'
require 'database_cleaner'

class ActiveSupport::TestCase
  def teardown
    DatabaseCleaner.clean
  end
end
