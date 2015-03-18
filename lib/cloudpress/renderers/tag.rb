module Cloudpress
  module Renderers
    class Tag

      attr_reader :tag

      def initialize(context, tag)
        @context = context
        @tag     = tag
      end

      def render 
        @context.render(partial: 'cloudpress/tags/tag', locals: {renderer: self})
      end

    end
  end
end