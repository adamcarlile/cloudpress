module Cloudpress
  module Renderers
    class Post

      attr_reader :post, :options
      attr_accessor :content

      def initialize(context, post, options={})
        @context = context
        @post    = post
        @options = options.reverse_merge default_options
      end

      def render(&block)
        @context.render layout: template, locals: {post: post, renderer: self} do
          content
        end.html_safe
      end

      def tags?
        options[:tags]
      end

      private

        def template
          "/cloudpress/posts/#{options[:template]}"
        end

        def default_options
          {
            template: :post,
            tags: true
          }
        end

    end
  end
end