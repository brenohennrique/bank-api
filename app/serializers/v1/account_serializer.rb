class V1::AccountSerializer < ActiveModel::Serializer
  attributes :id, :balance_amount, :name, :token

  def token
    JsonWebToken.encode(account_id: object.id)
  end
end
