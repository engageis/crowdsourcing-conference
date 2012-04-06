require 'spec_helper'

describe Video do
  
  describe "validations" do
    it{ should validate_presence_of :link }
    it "should have error, when video link is invalid" do
      video = Video.new link: "http://badurl.com/898029"
      video.should_not be_valid
    end
    
  end

  describe "fill video details from youtube or vimeo" do
    subject{ Video.create! link: "https://vimeo.com/28220980" }
    its(:video_id){ should == "28220980" }
    its(:provider){ should == "Vimeo" }
    its(:title){ should_not be_nil }
    its(:description){ should_not be_nil }
    its(:thumbnail_small){ should_not be_nil }
    its(:thumbnail_large){ should_not be_nil }
  end
end
