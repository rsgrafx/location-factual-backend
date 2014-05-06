require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Myhotspot
  class Application < Rails::Application
    # Allow for CORS -

    config.middleware.use Rack::Cors do 

        allow do
            origins '127.0.0.1:9393', '127.0.0.1:9000', 'localhost:9393', 'localhost:9000'
            resource '*', :headers => :any, :methods => [:get, :post, :options]
         end if Rails.env.development?

    end

    config.generators do |g|
        g.test_framework :rspec, 
            fixtures: true,
            view_specs: false,
            helper_specs: false,
            routing_specs: true,
            controller_specs: true,
            request_specs: true
        g.fixture_replacement :factory_girl, dir: "spec/factories"
    end

    config.to_prepare do 
        DeviseController.respond_to :html, :json
    end

  end
end
