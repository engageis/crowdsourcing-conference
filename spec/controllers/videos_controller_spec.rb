require 'spec_helper'

describe VideosController do
  describe "GET 'show'" do
    before do
      @video = Video.make!
    end
    it "returns http success" do
      get 'show', id: @video.id
      response.should be_success
    end
    it "return http error" do
      get 'show', id: 1000001
      response.response_code.should == 404
    end
  end
end
