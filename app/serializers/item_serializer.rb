class ItemSerializer < ActiveModel::Serializer
  attributes :name, :price
  attribute :messages, if: -> {@instance_options[:messages].present?}

  def messages
    @instance_options[:messages]
  end
end
