require 'webmock/rspec'
WebMock.disable_net_connect! :allow_localhost => true

config.after(:suite) do
  # To allow reporting to Code Climate
  WebMock.disable!
end
