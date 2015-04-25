module Cloudpress
  module Renderers
    class Flash

      attr_accessor :options, :type
      attr_writer :content
      def initialize(context, type, options={})
        @context   = context
        @type      = type
        @options   = options.reverse_merge(default_options)
      end

      def content
        @content ? @content : @context.content_tag(:p, @context.flash[type])
      end

      def content?
        !!content
      end

      def icon
        @context.icon(options[:icon]) if icon?
      end

      def render
        return nil unless content?
        @context.render(layout: 'cloudpress/flashes/flash', locals: {renderer: self}) do
          content
        end
      end

      def flash_html_attributes
        {
          id: options[:id],
          class: css_classes
        }.reject { |k, v| v.blank? }
      end

      private

        def icon?
          options[:icon].present?
        end

        def css_classes
          out = []
          out << 'flash'
          out << options[:class]
          out << type.to_s.parameterize
          out.compact.join(' ')
        end

        def default_options
          {
            icon: icon_map[type]
          }
        end

        def icon_map
          {
            notice: 'info-circle',
            alert: 'exclamation-triangle'
          }
        end

    end
  end
end
