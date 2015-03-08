module Cloudpress
  module Dropbox
    class Client

      attr_accessor :token, :options

      def initialize(token, options={})
        @token   = token
        @options = options.reverse_merge default_options
      end

      def connection
        @connection ||= DropboxClient.new(@token)
      end

    end
  end
end