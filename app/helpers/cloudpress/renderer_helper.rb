module Cloudpress
  module RendererHelper

    def render_cloudpress_post_list(posts, &block)
      Cloudpress::Renderers::Posts.new(self, posts).render
    end

    def render_cloudpress_post(post, options={}, &block)
      renderer = Cloudpress::Renderers::Post.new(self, post, options)
      renderer.content = capture(&block) if block_given?
      renderer.render
    end

    def render_cloudpress_archives(archives)
      
    end

  end
end