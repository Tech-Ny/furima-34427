class ApplicationController < ActionController::Base
  before_action :basic_auth
  #before_action :authenticate_user! ログイン画面への遷移:商品出品の際に使用しそうなので先に記述しておきます。
  before_action :configure_permitted_parameters, if: :devise_controller?

  
  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname,:email,:encrypted_password,:firstname,:lastname,:firstnamedetail,:lastnamedetail,:birthday])
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
  
end
