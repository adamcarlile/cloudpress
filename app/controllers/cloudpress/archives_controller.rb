module Cloudpress
  class ArchivesController < Cloudpress::ApplicationController

    def show

    end

    private

      def archive
        @archive ||= begin
          out = nil
          date = Date.new *[params[:year], params[:month]].compact.map(&:to_i)
          out = Cloudpress::Archive.year(date) if year?
          out = Cloudpress::Archive.find(date) if year? && month?
          out
        end
      end
      helper_method :archive

      def posts
        @posts ||= archive.posts
      end
      helper_method :posts

      def year?
        params[:year].present?
      end

      def month?
        params[:month].present?
      end

  end
end