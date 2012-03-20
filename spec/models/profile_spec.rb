require 'spec_helper'

describe Profile do
  it{ should have_many :profile_translations }
  it{ should validate_presence_of :name }
  it{ should validate_presence_of :company }
  it{ should validate_presence_of :kind }
  it{ should be_respond_to :bio }
  it{ should be_respond_to :country }

  describe "build translations" do
    subject{ Profile.new }
    its(:profile_translations){ should have(LOCALES.size).records }
  end

  describe "validates attachment presence" do
    subject{ Profile.new }
    it "should have a error in avatar_file_name" do
       subject.valid?.should be_false
       subject.errors[:avatar_file_name].count.should be 1
     end
  end

  describe "translations" do
    before do
      @profile = Profile.make
      @profile.profile_translations.map do |t| 
        t.bio = LOCALES[t.locale]
        t.country = LOCALES[t.locale]
      end
      @profile.save
    end
    subject{ @profile }

    context "english" do
      before{ I18n.locale = :en }
      its(:bio){ should == "English" }
      its(:country){ should == "English" }
    end

    context "portuguese" do
      before(:all){ I18n.locale = "pt-BR" }
      its(:bio){ should == "Portuguese" }
      its(:country){ should == "Portuguese" }
      after(:all){ I18n.locale = I18n.default_locale }
    end
  end
end
