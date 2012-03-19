class ProfileTranslation < ActiveRecord::Base
  belongs_to :profile
  validates_uniqueness_of :locale, :scope => :profile_id
  validates :bio, :country, presence: true
end
