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

  end
end