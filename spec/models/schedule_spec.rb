require 'spec_helper'

describe Schedule do
  it{ should have_many :schedule_translations }
  it{ should validate_presence_of :day }
  it{ should validate_presence_of :time }
  it{ should be_respond_to :description }

  describe "build translations" do
    subject{ Schedule.new }
    its(:schedule_translations){ should have(LOCALES.size).records }
  end

  describe "translations" do
    before do
      @schedule = Schedule.make
      @schedule.schedule_translations.map{ |t| t.description = LOCALES[t.locale] }
      @schedule.save
    end
    subject{ @schedule }

    context "english" do
      before{ I18n.locale = :en }
      its(:description){ should == "English" }
    end

    context "portuguese" do
      before{ I18n.locale = "pt-BR" }
      its(:description){ should == "Portuguese" }
    end
  end
end
