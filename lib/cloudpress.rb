require "dropbox_sdk"
require "metadown"
require "redcarpet"
require "pygments"
require "kaminari"
require "groupdate"
require "slim"
require "friendly_id"
require "acts-as-taggable-on"
require "cloudpress/version"
require "cloudpress/engine"

require "cloudpress/formatters/html_with_pygments"
require "cloudpress/dropbox/client"
require "cloudpress/dropbox/connector"
require "cloudpress/dropbox/directory"
require "cloudpress/dropbox/file"
require "cloudpress/dropbox/cleaner"

require "cloudpress/renderers/archive"
require "cloudpress/renderers/archives"
require "cloudpress/renderers/post"
require "cloudpress/renderers/posts"
require "cloudpress/renderers/tag"
require "cloudpress/renderers/tags"

module Cloudpress

  module_function

  def config
    @config ? @config : configure
  end

  def configure &block
    @config = ActiveSupport::OrderedOptions.new
    @config.app_key    = nil
    @config.app_secret = nil
    @config.app_token  = nil
    @config.base_path  = 'cloudpress'
    @config.live_path  = 'live'
    @config.draft_path = 'draft'
    @config.markdown_renderer = Redcarpet::Markdown.new(Formatters::HTMLWithPygments, fenced_code_blocks: true)
    yield(@config) if block_given?
    @config
  end

  def base_path
    "/#{config.base_path}"
  end

  def reload!
    @file_index = nil
  end

  def live_path
    [base_path, config.live_path].join('/')
  end

  def draft_path
    [base_path, config.draft_path].join('/')
  end

  def update!
    reload!
    import!
    purge!
  end

  def import!
    file_index.values.each {|x| x.import!}
  end

  def purge!
    Cloudpress::Dropbox::Cleaner.new(remote_paths, local_paths).clean!
  end

  def file_index
    @file_index ||= {
      live: Cloudpress::Dropbox::Directory.new(client, live_path, :live),
      draft: Cloudpress::Dropbox::Directory.new(client, draft_path, :draft)
    }
  end

  def client
    @client ||= Cloudpress::Dropbox::Client.new(config.app_token)
  end

  def unconfigured?
    config.app_key.blank? || config.app_secret.blank?
  end

  def unauthorized?
    config.app_token.blank?
  end

  def remote_paths
    file_index.values.map {|x| x.paths }.flatten
  end

  def local_paths
    Cloudpress::Post.pluck(:file_path)
  end

end
