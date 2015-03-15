module Cloudpress
  class Engine < Rails::Engine
    engine_name 'cloudpress'
    isolate_namespace Cloudpress

    config.to_prepare do
      ApplicationController.helper Cloudpress::RendererHelper
    end
  end
end