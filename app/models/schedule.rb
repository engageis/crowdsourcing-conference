class Schedule < ActiveRecord::Base
  translates :description
  has_many :schedule_translations
  validates :day, :time, presence: true
  accepts_nested_attributes_for :schedule_translations, :allow_destroy => true
  after_initialize :build_translations

  scope :first_day, where(day: 1)
  scope :second_day, where(day: 2)

  protected
  def build_translations
    if schedule_translations.empty?
      LOCALES.each do |lang|
        schedule_translations.find_or_initialize_by_locale(lang[0])
      end
    end
  end
end
