module Cloudpress
  class Archive
    class << self

      def all
        wrap(Cloudpress::Post.unscoped.group_by_month(:publish_date).count.keys.group_by {|x| x.year})
      end

      def find(date)
        raise ArgumentError unless date.respond_to?(:year)
        new(date.beginning_of_month..date.end_of_month)
      end

      private

        def wrap(hash)
          hash.map { |k, v| new(date_range(v)) }
        end

        def date_range(range)
          range.first.to_time.beginning_of_month.in_time_zone..range.last.to_time.end_of_month.in_time_zone
        end

    end

    attr_reader :range

    def initialize(range)
      @range = range
    end

    def year
      range.first.year
    end

    def months
      @months ||= (range.first.to_date..range.last.to_date).map {|x| x.beginning_of_month}.uniq
    end

    def posts
      @posts ||= Cloudpress::Post.published.between(@range)
    end

  end
end