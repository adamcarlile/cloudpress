module Cloudpress
  module Renderers
    class Posts

      attr_reader :context, :posts

      def initialize(context, posts)
        @context = context
        @posts   = posts
      end

      def wrapped_posts
        @wrapped_posts ||= posts.map {|post| Cloudpress::Renderers::Post.new(context, post, template: :intro)}
      end

      def render
        context.content_tag(:div, id: 'post-list') do
          wrapped_posts.map(&:render).join("\n").html_safe
        end
      end
      
    end
  end
end
