class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_locale

  def set_locale
    return unless params[:locale]
    I18n.locale = params[:locale]
  end
end
