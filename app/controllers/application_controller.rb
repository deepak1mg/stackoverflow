class ApplicationController < ActionController::Base

  helper_method :current_user
  
  def current_user
    return unless @session[:user_id].present?
    @current_user ||= User.find(session[:user_id])
  end

  # def current_user
  #   if session[:user_id]
  #     @current_user ||= User.find(session[:user_id])
  #   else
  #     @current_user = nil
  #   end
  # end

  def password_hash(password, created)
  	key = Rails.application.secrets.secret_key_base.to_i
  	pass = password.to_i
  	create_time = created.to_i
  	(key^pass^create_time).to_i
  end

  def auth
    return unless auth_token.present?
    @auth ||= Authdetail.find_by_auth_token(auth_token)
  end

  def auth_token
    request.headers['Authorization']
  end

end
