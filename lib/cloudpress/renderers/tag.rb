module Cloudpress
  module Renderers
    class Tag

      def initialize(context, tag)
        @context = context
        @tag     = tag
      end

      def render 
        @context.render(partial: 'cloudpress/tags/tag', locals: {renderer: self, tag: @tag})
      end

    end
  end
end