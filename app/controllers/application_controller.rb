class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def confirm_logged_in
    if session[:user_id]
      true
    else
      flash[:notice] = 'Please log in.'
      redirect_to(controller: 'access', action: 'login')
      false
    end
  end
end
