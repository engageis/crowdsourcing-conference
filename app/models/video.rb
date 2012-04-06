class Video < ActiveRecord::Base
  validates :link, presence: true
  after_create :fill_details
  validate :valid_link?, :on => :create
  default_scope order(:title)

  private
  def valid_link?
    errors.add(:link, "Invalid link. Use videos from Youtube or Vimeo.") unless VideoInfo.new(link).valid?
  end

  def fill_details
    video = VideoInfo.new(link)
    return unless video.valid?
    self.link = video.url
    self.video_id = video.video_id
    self.title = video.title
    self.description = video.description
    self.provider = video.provider
    self.thumbnail_small = video.thumbnail_small
    self.thumbnail_large = video.thumbnail_large
    save
  end
end
