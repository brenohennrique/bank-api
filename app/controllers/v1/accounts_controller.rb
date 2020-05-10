class V1::AccountsController < ApplicationController
  def create
    account = Account.new(account_params_create)

    if account.save
      render json: account, status: :created, each_serializer: V1::AccountSerializer
    else
      render json: account.errors, status: :unprocessable_entity
    end
  end

  private

  def account_params_create
    params.permit(:name, :balance_amount, :password, :password_confirmation)
  end
end
