module SessionsHelper
  def sign_in(user)
    session[:user_id] = user.id if !user.nil?
    return user
  end

  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  def current_user
    @current_user ||= session_user || remembered_user
  end

  def current_user=(user)
    @current_user = user
  end

  def session_user
    User.find_by(id: session[:user_id])
  end

  def remembered_user
    if user = User.find_by(id: cookies.signed[:user_id])
      sign_in(
        user.authenticate_token :remember, cookies[:remember_token]
      )
    end
  end

  def signed_in?
    !current_user.nil?
  end

  def sign_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end

  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end
end
