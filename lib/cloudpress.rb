require "dropbox_sdk"
require "cloudpress/version"
require "cloudpress/engine"

require "cloudpress/dropbox/client"
require "cloudpress/dropbox/connector"

module Cloudpress

  module_function

  def config
    @config ? @config : configure
  end

  def configure &block
    @config = ActiveSupport::OrderedOptions.new
    @config.app_key    = nil
    @config.app_secret = nil
    @config.base_path  = 'cloudpress'
    @config.live_path  = 'live'
    @config.draft_path = 'draft'
    yield(@config) if block_given?
  end

  def base_path
    "/#{config.base_path}"
  end

  def live_path
    [base_path, config.live_path].join('/')
  end

  def draft_path
    [base_path, config.draft_path].join('/')
  end

  def client
    @client ||= Cloudpress::Dropbox::Client.new(Cloudpress::Setting.cloudpress_access_token)
  end

  def connector
    @connector ||= Cloudpress::Dropbox::Connector.new(config.app_key, config.app_secret)
  end

  def authorize_url
    connector.authorize_url
  end

  def authorize!(code)
    Cloudpress::Setting.cloudpress_access_token = connector.authorize!(code)
  end

  def unauthorized?
    Cloudpress::Setting.cloudpress_access_token.blank?
  end

end
