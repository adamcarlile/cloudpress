module Cloudpress
  class TagsController < Cloudpress::ApplicationController

    def show
    end

    protected

      def tagging
        @tagging ||= ActsAsTaggableOn::Tag.find(params[:id])
      end
      helper_method :tagging

      def posts
        @posts ||= Cloudpress::Post.tagged_with(tagging.name)
      end
      helper_method :posts

  end
end