module Cloudpress
  module Dropbox
    class Directory

      attr_reader :path, :client, :state

      def initialize(client, path, state)
        @client      = client
        @path        = path
        @state       = state
      end

      def import!
        files.each { |x| x.import! }
        subdirectories.each {|x| x.import! }
      end

      def paths
        @paths ||= begin
          files.map {|x| x.path } + subdirectories.map { |x| x.paths }
        end.flatten.compact.uniq
      end

      def directory_contents
        remote_path_metadata.with_indifferent_access[:contents]
      end

      def files
        @files ||= directory_contents.select { |x| x[:is_dir] == false }.map do |x| 
          Cloudpress::Dropbox::File.new(x[:path], x[:rev], state)
        end
      end

      def subdirectories
        @subdirectories ||= directory_contents.select { |x| x[:is_dir] == true }.map do |x|
          Cloudpress::Dropbox::Directory.new(client, x[:path], state)
        end
      end

      private

        def create_path!
          client.connection.file_create_folder path
        end
        
        def remote_path_metadata
          @remote_path_metadata ||= begin
            client.connection.metadata(path)
          rescue DropboxError
            create_path!
            client.connection.metadata(path)
          end
        end

    end
  end
end