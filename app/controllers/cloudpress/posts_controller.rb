module Cloudpress
  class PostsController < Cloudpress::ApplicationController

    def index
      binding.pry
    end

    protected

      def posts
        @posts ||= Cloudpress::Post.latest
      end

  end
end