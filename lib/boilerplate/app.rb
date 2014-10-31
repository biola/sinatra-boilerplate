module Boilerplate
  require 'sinatra/base'
  require 'sinatra/asset_pipeline'

  class App < Sinatra::Base
    require 'slim'

    # Setup asset pipeline
    set :assets_prefix, %w(assets vendor/assets)
    set :assets_css_compressor, :sass
    set :assets_js_compressor, :uglifier
    register Sinatra::AssetPipeline

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
