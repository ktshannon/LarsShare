#!/usr/bin/env ruby

require 'bundler/setup'
Bundler.require(:default)
Dotenv.load

require 'csv'

require_relative './world'
Dir['actions/*.rb'].each { |f| require_relative f }

WEB_UI = true
REQUEST_CONCURRENCY = 5
REQUEST_LIMIT = 10            # -1 for unlimited

World.world.action_logger.level = Logger::INFO
triggered = World.world.trigger(CreateFeed)

if WEB_UI
  World.run_web_console
else
  triggered.finished.wait
end
