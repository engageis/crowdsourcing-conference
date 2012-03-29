class Profile < ActiveRecord::Base
  KINDS = ["Speaker", "Workshop"]

  translates :bio, :country
  has_many :profile_translations
  has_attached_file :avatar, :styles => { default: "280x160>" }
  validates :name, :company, :kind, presence: true
  validates_attachment_presence :avatar
  accepts_nested_attributes_for :profile_translations, :allow_destroy => true
  after_initialize :build_translations

  scope :speakers, where(kind: "Speaker")
  scope :workshops, where(kind: "Workshop")

  protected
  def build_translations
    if profile_translations.empty?
      LOCALES.each do |lang|
        profile_translations.find_or_initialize_by_locale(lang[0])
      end
    end
  end
end
