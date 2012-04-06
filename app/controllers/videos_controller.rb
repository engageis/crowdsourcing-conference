class VideosController < ApplicationController
  def show
    begin
      @video = Video.find(params[:id])
      @video_embed = video_embed(@video.link)
      render :layout => !request.xhr?
    rescue ActiveRecord::RecordNotFound
      render :text => "404 Not Found", :status => 404
    end
  end
end
