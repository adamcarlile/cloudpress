module Cloudpress
  class PostsController < Cloudpress::ApplicationController

    def index
    end

    def show
    end

    protected

      def posts
        @posts ||= Cloudpress::Post.page(params[:page])
      end

      def post
        @post ||= Cloudpress::Post.find_by(slug: params[:slug])
      end

  end
end