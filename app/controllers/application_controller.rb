class ApplicationController < ActionController::Base
  #protect_from_forgery with: :exception
  
  #helper_method :current_user
  
  def current_user
    @auth = Authdetail.find_by_auth_token(auth_token)
    return nil if expiry_check
    @current_user=@auth.user
  end

  private

  def auth_token
    request.headers['Authorization']
  end

  def expiry_check
    if session[:expires_at] < Time.now || @auth.inactive?
      @auth.inactive!
      @current_user = nil
      true
    end
  end

end
