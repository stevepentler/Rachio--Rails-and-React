ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/autorun'
require 'minitest/pride'
require 'capybara/rails'
require 'database_cleaner'
require 'vcr'
require 'minitest-vcr'
require 'webmock'

class ActiveSupport::TestCase
  def teardown
    DatabaseCleaner.clean
  end

  VCR.configure do |config|
    config.cassette_library_dir = 'test/cassettes'
    config.hook_into :webmock
    config.allow_http_connections_when_no_cassette = true
  end

  MinitestVcr::Spec.configure!
end
