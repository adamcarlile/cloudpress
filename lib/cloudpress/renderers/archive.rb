module Cloudpress
  module Renderers
    class Archive

      attr_reader :archive

      def initialize(context, archive)
        @context = context
        @archive = archive
      end

      def render
        @context.render(partial: 'cloudpress/archives/archive', locals: {renderer: self, archive: archive})
      end

    end
  end
end