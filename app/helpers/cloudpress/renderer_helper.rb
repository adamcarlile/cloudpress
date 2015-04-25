module Cloudpress
  module RendererHelper

    def render_cloudpress_posts(posts, options={}, &block)
      Cloudpress::Renderers::Posts.new(self, posts, options).render
    end

    def render_cloudpress_post(post, options={}, &block)
      renderer = Cloudpress::Renderers::Post.new(self, post, options)
      renderer.content = capture(&block) if block_given?
      renderer.render
    end

    def render_cloudpress_tags(tags)
      Cloudpress::Renderers::Tags.new(self, tags).render
    end

    def render_cloudpress_archives(archives)
      Cloudpress::Renderers::Archives.new(self, archives).render
    end

    def render_flashes
      content_tag(:div, id: 'flashes') do
        flash.map {|k, v| render_flash(k.to_sym) { content_tag(:p, v) } }.join("\n").html_safe
      end
    end

    def render_flash type, options={}, &block
      renderer = Cloudpress::Renderers::Flash.new(self, type, options)
      renderer.content = capture(&block) if block_given?
      renderer.render
    end

  end
end