module Cloudpress
  class InitializerGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)
    
    def create_initializer_file    
      if Cloudpress.unconfigured?
        say "Cloudpress is unconfigured, please enter the following:"
        app_key    = ask "Application Key:"
        app_secret = ask "Application Secret:"
      else
        app_key     = Cloudpress.config.app_key
        app_secret = Cloudpress.config.app_secret
      end

      connector  = Cloudpress::Dropbox::Connector.new(app_key, app_secret)

      say "Please visit the following URL: #{connector.authorize_url}"
      code  = ask("Enter the code:")
      token, _uid = connector.authorize!(code)

      initializer 'cloudpress.rb' do 
        <<-EOF
Cloudpress.configure do |config|
  config.app_id     = "#{app_key}"
  config.app_secret = "#{app_secret}"
  config.app_token  = "#{token}"
end
        EOF
      end
    end
  end
end