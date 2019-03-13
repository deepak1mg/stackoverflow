class ApplicationController < ActionController::Base
  #protect_from_forgery with: :exception
  
  #helper_method :current_user
 

  def current_user
    @auth = Authdetail.find_by_auth_token(auth_token)
    return @current_user = nil if if_expired == true
    @current_user ||= @auth.user
  end

  private

  def auth_token
    request.headers['Authorization']
  end

  def if_expired
    if session[:expires_at] < Time.now
      @auth.inactive!
      return true
    end
    false
  end

end
