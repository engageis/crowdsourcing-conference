class Event < ActiveRecord::Base
  translates :text
  has_many :event_translations
  accepts_nested_attributes_for :event_translations#, :allow_destroy => true
  
  
  protected
    def create_missing_translations
      ADDITIONAL_LOCALES.each do |lang|
        t = translations.find_by_locale(lang[0].to_s)
        if t.nil?
          translations.create(:locale => lang[0].to_s)
        end
      end
    end
end
