module Cloudpress
  module Dropbox
    class Client

      def initialize(token)
        @token   = token
      end

      def connection
        @connection ||= DropboxClient.new(@token)
      end

    end
  end
end