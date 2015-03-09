module Cloudpress
  module Dropbox
    class File

      attr_reader :path, :revision, :state

      def initialize(path, revision, state)
        @path     = path
        @revision = revision
        @state    = state
      end

      def import!
        local_copy.update_from_dropbox(self) if changed?
      end

      def remote_file
        @remote_file ||= Cloudpress.client.connection.get_file(@path)
      end

      def local_copy
        @local_copy ||= Cloudpress::Post.where(file_path: @path).first_or_initialize
      end

      def metadata
        @metadata ||= metadown.metadata
      end

      def body
        @body ||= metadown.output
      end

      def title
        metadata['title'] || @path.split('/').last.split('.').first.titleize
      end

      def changed?
        !persisted? || revision_changed?
      end

      private

        def persisted?
          local_copy.persisted?
        end

        def revision_changed?
          local_copy.revision != @revision
        end

        def metadown
          @metadown ||= Metadown.render(remote_file, Cloudpress.config.markdown_renderer)
        end

    end
  end
end