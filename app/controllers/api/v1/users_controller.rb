class Api::V1::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token, except: [:index, :new, :show]
  before_action :authenticate_with_token!
  before_action :find_user, only: [:update, :destroy]

  def index
    users =  current_user.users
    render json: users
  end

  def show
    user = current_user.users.find_by_id params[:id]
    render json: user
  end

  def create
    user = current_user.users.build user_params
    if user.save
      render json: user, serializer: UserSerializer,
        messages: I18n.t("api.#{user.role}.create_success")
    else
      render json: {errors: user.errors}, status: 422
    end
  end

  def update
    if @user.update_attributes user_params
      render json: @user, serializer: UserSerializer,
        messages: t("api.#{@user.role}.update_success"), status: 200
    else
      render json: {messages: t("api.#{@user.role}.update_fail")}
    end
  end

  def destroy
    return unless @user.present?
    if @user.destroy
      render json: {messages: t("api.delete_user_success")}, status: 200
    else
      render json: {messages: t("api.delete_user_fail")}
    end
  end

  private
  def user_params
    params.permit :full_name, :birthday, :tel_number, :address, :salary,
      :meeting_money, :registry_date, :expiry_date, :avatar, :role
  end

  def find_user
    @user = current_user.users.find_by_id params[:id]
  end
end
