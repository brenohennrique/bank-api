class V1::TokensController < ApplicationController
  def create
    account = Account.find_by name: account_params[:name]

    if account&.authenticate(account_params[:password])
      render json: account, status: :ok, each_serializer: V1::TokenSerializer
    else
      head :unauthorized
    end
  end

  private

  def account_params
    params.permit(:name, :password)
  end
end
