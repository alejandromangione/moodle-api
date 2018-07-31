require 'moodle'
require 'webmock/rspec'
require 'vcr'

# WebMock.disable_net_connect!(allow_localhost: true) unless ENV['REAL_CONECTIONS']

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  c.hook_into :webmock
end