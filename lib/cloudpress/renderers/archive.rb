module Cloudpress
  module Renderers
    class Archive

      attr_reader :context, :archive

      def intialize(context, archive)
        @context = context
        @archive = archive
      end

    end
  end
end