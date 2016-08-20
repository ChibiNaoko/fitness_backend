module Authenticable

  def current_user
    authentication_token = params[:auth_token] || request.env["HTTP_AUTH_TOKEN"]
    @current_user ||= Manager.find_by(auth_token: authentication_token) if authentication_token
  end

  def authenticate_with_token!
    render json: {errors: "Not authenticated"},
      status: :unauthorized unless user_signed_in?
  end

  def user_signed_in?
    current_user.present?
  end
end
