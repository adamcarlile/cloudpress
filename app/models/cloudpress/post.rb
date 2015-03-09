module Cloudpress
  class Post < ActiveRecord::Base
    default_scope ->{ order(publish_date: :desc) }
    paginates_per 10

    def update_from_dropbox(dropbox_file)
      self.revision     = dropbox_file.revision
      self.body         = dropbox_file.body
      self.metadata     = dropbox_file.metadata
      self.title        = metadata[:title] || titleized_file_name
      self.publish_date = created_at || Time.now
      self.publish_date = Time.parse(metadata[:publish_date]) if metadata[:publish_date]
      self.slug         = metadata[:slug] || generate_slug
      self.state        = dropbox_file.state
      save!
    end

    def to_param
      slug
    end

    def layout
      metadata[:layout]
    end

    def metadata
      super.with_indifferent_access
    end

    def summary
      @summary   ||= Nokogiri::HTML(body).at_css('p').text
    end

    def wordcount
      @wordcount ||= Nokogiri::HTML(body).inner_text.split(' ').size
    end

    def time_to_read
      @time_to_read ||= ((wordcount.to_f / 200.0) * 60).to_i
    end

    private

      def generate_slug
        slug_parts = []
        slug_parts << publish_date.year
        slug_parts << publish_date.month
        slug_parts << title.parameterize
        slug_parts.join('/')
      end

  end
end
