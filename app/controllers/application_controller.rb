class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  #def default_url_options
  #  { locale: I18n.locale }
  #end

  before_action :set_locale

  #def set_locale
  #  I18n.locale = params[:locale] || I18n.default_locale
  #end

  protect_from_forgery with: :exception
  include SessionsHelper


  private

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    def set_locale
      I18n.locale = http_accept_language.compatible_language_from(I18n.available_locales)
      #I18n.locale = params[:locale] || I18n.default_locale
    end

end
