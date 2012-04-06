class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_locale
  include AutoHtml
  def set_locale
    return unless params[:locale]
    I18n.locale = params[:locale]
  end

  def index_page
    @the_event = auto_html(Event.first.text){ html_escape; simple_format } rescue nil
    @videos = Video.all
    @video_embed = video_embed(@videos.first.link) rescue nil
  end

  def video_embed link
    auto_html(link) do
      html_escape
      youtube width: 925, height: 525, wmode: "opaque"
      vimeo width: 925, height: 525
    end
  end
end
