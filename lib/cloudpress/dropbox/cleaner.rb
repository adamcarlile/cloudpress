module Cloudpress
  module Dropbox
    class Cleaner

      def initialize(remote_paths, local_paths)
        @local_paths = local_paths
        @remote_paths = remote_paths
      end

      def orphaned_paths
        @orphaned_paths ||= @local_paths - @remote_paths
      end

      def clean!
        Post.where(file_path: orphaned_paths).destroy_all if orphaned_paths.any?
      end

    end
  end
end