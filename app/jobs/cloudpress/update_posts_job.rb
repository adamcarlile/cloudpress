module Cloudpress
  class UpdatePostsJob < ActiveJob::Base
    queue_as :default

    def perform
      Cloudpress.update!
    end
  end
end
