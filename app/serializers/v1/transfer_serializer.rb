class V1::TransferSerializer < ActiveModel::Serializer
  attributes :amount, :source_account_id, :destination_account_id
end
