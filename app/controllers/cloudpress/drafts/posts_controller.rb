module Cloudpress
  module Drafts
    class PostsController < ::Cloudpress::PostsController
      http_basic_authenticate_with(Cloudpress.draft_auth_credentials) if Cloudpress.protect_drafts? 

      def index
        super
        flash[:notice] = "Currently viewing draft index, move to the live folder to publish"
      end

      def show
        super
        flash[:notice] = "This post is currently a draft, move to the live folder to publish"
      end

      protected

        def posts
          @posts ||= Cloudpress::Post.draft.page(params[:page])
        end
        helper_method :posts

        def post
          @post ||= Cloudpress::Post.draft.find_by(slug: params[:slug])
        end
        helper_method :post

    end
  end
end