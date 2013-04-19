require 'capybara'
require 'capybara/dsl'
require 'capybara/webkit'
require 'sinatra/base'
require 'rspec'

class Wood
  include Capybara::DSL
  include RSpec::Expectations
  include RSpec::Matchers
end

World do
  Wood.new
end
