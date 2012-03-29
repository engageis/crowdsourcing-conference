class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_locale
  include AutoHtml
  def set_locale
    return unless params[:locale]
    I18n.locale = params[:locale]
  end

  def index_page
    @the_event = auto_html(Event.first.text){ html_escape; simple_format }
  end
end
