module Boilerplate
  require 'sinatra/base'

  class App < Sinatra::Base
    require 'slim'

    configure do
      set :environment, (ENV['RACK_ENV'] || :development).to_sym
      set :root, File.expand_path('./../..', File.dirname(__FILE__))
      set :app_file, File.join(settings.root, 'lib', 'boilerplate', 'app.rb')

      disable :run
      enable :logging

      Slim::Engine.set_default_options :pretty => true
    end


    get '/' do
      slim :home
    end

  end
end