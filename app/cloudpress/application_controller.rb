module Cloudpress
  class ApplicationController < ActionController::Base
    before_action :verify_cloudpress_oauth_settings

    protected

      def verify_cloudpress_oauth_settings
        redirect_to Cloudpress.authentication_url if Cloudpress.unauthorized?
      end

  end
end