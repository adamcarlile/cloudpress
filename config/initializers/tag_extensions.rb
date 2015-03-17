class ActsAsTaggableOn::Tag
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]
end