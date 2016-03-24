module World
  def self.world
    @world ||= create_world
  end

  def self.create_world
    config = Dynflow::Config.new
    config.persistence_adapter = Dynflow::PersistenceAdapters::Sequel.new 'sqlite:/'
    config.logger_adapter      = Dynflow::LoggerAdapters::Simple.new $stderr
    # config.auto_rescue         = false
    config.auto_execute = true

    Dynflow::World.new(config)
  end

  def self.run_web_console
    require 'dynflow/web'
    dynflow_console = Dynflow::Web.setup do
      set :world, World.world
    end
    Rack::Server.new(:app => dynflow_console, :Port => 4567).start
  end

  def self.terminate
    @world.terminate.wait
  end
end

at_exit { World.terminate }
