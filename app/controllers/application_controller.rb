class ApplicationController < ActionController::Base

  helper_method :current_user
  
  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  def my_hash(password,created)
  	key=Rails.application.secrets.secret_key_base.to_i
  	pass=password.to_i
  	create_time=created.to_i
  	(key^pass^create_time).to_i
  end

end
