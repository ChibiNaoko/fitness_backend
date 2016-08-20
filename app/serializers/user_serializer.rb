class UserSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :birthday, :tel_number, :address, :role, :manager_id
  attribute :meeting_money, if: -> {object.trainer?}
  attribute :salary, if: -> {object.trainer?}
  attribute :expiry_date, if: -> {object.customer?}
  attribute :registry_date, if: -> {object.customer?}
  attribute :messages, if: -> {@instance_options[:messages].present?}

  def messages
    @instance_options[:messages]
  end
end
