ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../dummy/config/environment", __FILE__)
require 'rspec/rails'
require 'helpers/fixtures_helper'

RSpec.configure do |config|
  config.use_transactional_fixtures = true
  config.infer_base_class_for_anonymous_controllers = false
  config.order = "random"

  config.expect_with :rspec do |c|
    c.syntax = [:expect, :should]
  end

  config.mock_with :rspec do |c|
    c.syntax = :should
  end

  config.before :each do
    Griddler.configuration.email_service = :default
  end
end
