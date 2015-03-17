module Cloudpress
  module Renderers
    class Archives

      attr_reader :archives

      def initialize(context, archives)
        @context  = context
        @archives = archives
      end

      def wrapped_archives
        @wrapped_archives ||= archives.map {|archive| Cloudpress::Renderers::Archive.new(@context, archive)}
      end

      def render
        @context.render(layout: 'cloudpress/archives/archives', locals: {renderer: self}) do
          wrapped_archives.map(&:render).join("\n").html_safe
        end
      end
      
    end
  end
end
