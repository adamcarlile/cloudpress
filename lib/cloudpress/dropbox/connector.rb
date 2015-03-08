module Cloudpress
  module Dropbox
    class Connector

      def initialize(key, secret)
        @key    = key
        @secret = secret
      end

      def flow
        @flow ||= DropboxOAuth2FlowNoRedirect.new(@key, @secret)
      end

      def authorize_url
        @authorize_url ||= flow.start
      end

      def authorize!(code)
        flow.finish(code)
      end

    end
  end
end