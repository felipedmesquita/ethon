# frozen_string_literal: true
require 'bundler/setup'
require 'rspec'
require 'ethon'

require_relative 'support/localhost_server'
require_relative 'support/server'

# Ethon.logger = Logger.new($stdout).tap do |log|
#   log.level = Logger::DEBUG
# end

RSpec.configure do |config|
  # config.order = :rand

  config.before(:suite) do
    LocalhostServer.new(TESTSERVER.new, 3001)
  end
end
