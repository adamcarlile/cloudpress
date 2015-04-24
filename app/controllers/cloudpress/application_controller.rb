module Cloudpress
  class ApplicationController < ::ApplicationController

    protected

      def archives
        @archives ||= Cloudpress::Archive.all
      end
      helper_method :archives

      def tags
        @tags ||= ActsAsTaggableOn::Tag.all
      end
      helper_method :tags

  end
end
