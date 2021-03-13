class ApplicationController < ActionController::Base
  # クロスサイトリクエストフォージェリ対策
  protect_from_forgery with: :exception
  # ログインしていないユーザーをログイン画面に表示
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end
end
