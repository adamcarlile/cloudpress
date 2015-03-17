module Cloudpress
  module Renderers
    class Posts

      attr_reader :posts, :options

      def initialize(context, posts, options={})
        @context = context
        @posts   = posts
        @options = options.reverse_merge default_options
      end

      def wrapped_posts
        @wrapped_posts ||= posts.map {|post| Cloudpress::Renderers::Post.new(@context, post, options)}
      end

      def render
        @context.content_tag(:div, id: 'post-list') do
          wrapped_posts.map(&:render).join("\n").html_safe
        end
      end

      def tags?
        options[:tags]
      end

      private

        def default_options
          {
            template: :intro,
            tags: true
          }
        end
      
    end
  end
end
