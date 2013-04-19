module Test
  class FakeServer < Sinatra::Base
    set :server, :thin
    set :port, 8080

    get '/' do
      erb :index
    end
  end
end

Capybara.register_driver :webkit do |app|
  Capybara::Webkit::Driver.new app
end

Capybara.default_driver = :selenium
#Capybara.default_driver = :webkit # both are failing
Capybara.server_port = 8080
fakeServer = Capybara::Server.new(Test::FakeServer.new).tap { |server| server.boot }

Capybara.app_host = "http://#{fakeServer.host}:#{fakeServer.port}"
