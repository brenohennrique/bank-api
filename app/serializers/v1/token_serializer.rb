class V1::TokenSerializer < ActiveModel::Serializer
  attributes :name, :token

  def token
    JsonWebToken.encode(account_id: object.id)
  end
end
