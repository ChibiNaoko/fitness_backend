class Api::V1::SessionsController < Devise::SessionsController
  skip_before_action :verify_authenticity_token, only: [:create, :destroy]
  skip_before_action :verify_signed_out_user, only: :destroy

  def create
    email = params[:email]
    password = params[:password]
    user = email.present? && Manager.find_by(email: email)
    if user && user.valid_password?(password)
      sign_in user, store: false
      user.generate_authentication_token!
      user.save
      render json: {user: user, success_message: t("api.login_success")}, status: 200
    else
      render json: {error_message: t("api.login_fail")}, status: 422
    end
  end

  def destroy
    if current_user.present?
      current_user.generate_authentication_token!
      current_user.save
      sign_out current_user
      render json: {success_message: t("api.logout_success")}
    else
      render json: {error_message: t("api.logout_fail")}
    end
  end
end
