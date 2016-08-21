class Api::V1::ItemsController < ApplicationController
  skip_before_action :verify_authenticity_token, except: [:index, :new, :show]
  before_action :authenticate_with_token!
  before_action :find_item, only: [:update, :destroy, :show]

  def index
    items = current_user.items
    render json: items
  end

  def show
    render json: @item
  end

  def create
    item = current_user.items.new item_params
    if item.save
      render json: item, serializer: ItemSerializer,
        messages: t("api.item.create_success"), status: 200
    else
      render json: {error: item.errors}
    end
  end

  def update
    if @item.update_attributes item_params
      render json: {item: @item, messages: t("api.item.update_success")}
    else
      render json: {error: item.errors}
    end
  end

  def destroy
    return unless @item.present?
    if @item.destroy
      render json: {messages: t("api.item.delete_success")}, status: 200
    else
      render json: {messages: t("api.item.delete_fail")}
    end
  end

  private
  def item_params
    params.permit :name, :price, :manager_id
  end

  def find_item
    @item = current_user.items.find_by_id params[:id]
  end
end
