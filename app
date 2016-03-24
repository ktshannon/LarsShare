#!/usr/bin/env ruby

require 'bundler/setup'
Bundler.require(:default)
Dotenv.load

require 'csv'

require_relative './world'
Dir['actions/*.rb'].each { |f| require_relative f }

World.world.action_logger.level = Logger::INFO
World.world.trigger(CreateFeed).finished.wait
