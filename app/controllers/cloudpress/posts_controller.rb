module Cloudpress
  class PostsController < Cloudpress::ApplicationController

    def index
    end

    def show
    end

    protected
    
      def posts
        @posts ||= Cloudpress::Post.published.page(params[:page])
      end
      helper_method :posts

      def post
        @post ||= Cloudpress::Post.find_by(slug: params[:slug])
      end
      helper_method :post

  end
end