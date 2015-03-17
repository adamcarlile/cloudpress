module Cloudpress
  module Renderers
    class Tags

      attr_reader :tags

      def initialize(context, tags)
        @context  = context
        @tags     = [tags].flatten.compact
      end

      def render
        @context.render layout: 'cloudpress/tags/tags', locals: {renderer: self} do
          wrapped_tags.map(&:render).join("\n").html_safe
        end
      end

      def wrapped_tags
        @wrapped_tags ||= tags.map {|tag| Cloudpress::Renderers::Tag.new(@context, tag)}
      end

    end
  end
end