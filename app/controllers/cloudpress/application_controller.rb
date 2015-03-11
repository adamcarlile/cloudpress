module Cloudpress
  class ApplicationController < ::ApplicationController

    protected

      def archives
        @archive ||= Cloudpress::Archive.all
      end
      helper_method :archives

  end
end
