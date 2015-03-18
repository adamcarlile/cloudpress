module Cloudpress
  class ApplicationController < ::ApplicationController

    protected

      def archives
        @archives ||= Cloudpress::Archive.all
      end
      helper_method :archives

  end
end
