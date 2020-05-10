class V1::AccountsController < ApplicationController
  before_action :authenticate_account!, only: %i[balance]

  def create
    account = Account.new(account_params_create)

    if account.save
      render json: account, status: :created, each_serializer: V1::AccountSerializer
    else
      render json: account.errors, status: :unprocessable_entity
    end
  end

  def balance
    render json: @current_account, serializer: V1::BalanceAccountSerializer
  end

  private

  def account_params_create
    params.permit(:name, :balance_amount, :password, :password_confirmation)
  end
end
