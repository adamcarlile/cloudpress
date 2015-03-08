module Cloudpress
  class Engine < Rails::Engine
    engine_name 'cloudpress'
    isolate_namespace Cloudpress
  end
end