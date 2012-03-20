require 'spec_helper'

describe Event do
  it{ should have_many :event_translations }
  it{ should be_respond_to :text }

  describe "translations" do
    before do
      @event = Event.make!
      LOCALES.each do |lang|
        EventTranslation.make! event: @event, locale: lang[0], text: lang[1]
      end
    end
    subject{ @event }

    context "english" do
      before{ I18n.locale = :en }
      its(:text){ should == "English" }
    end

    context "portuguese" do
      before{ I18n.locale = "pt-BR" }
      its(:text){ should == "Portuguese" }
      after{ I18n.locale = I18n.default_locale }
    end
  end
end
