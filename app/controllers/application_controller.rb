class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # ログインの確認
  before_action :authenticate_user!

  def configure_permitted_parameters
    #strong parametersを設定し、usernameを許可
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :password, :password_confirmation) }

    # ログイン時に username と password　でログインする
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:username, :password, :remember_me) }
  end 
end
