class V1::TransfersController < ApplicationController
  before_action :authenticate_account!

  def create
    if registry_transfer
      render json: @transfer, status: :created
    else
      render json: @errors, status: :unprocessable_entity
    end
  end

  private

  def registry_transfer
    ApplicationRecord.transaction do
      subsctract_source
      increment_destination
      create_transfer
    end
  rescue
    false
  end

  def subsctract_source
    account = Account.find @current_account.id
    account.balance_amount = account.balance_amount.to_f - params[:amount].to_f
    account.save!

  rescue ActiveRecord::RecordInvalid
    @errors = account.errors.messages
    raise ActiveRecord::RecordInvalid
  end

  def increment_destination
    account = Account.find params[:destination_account_id]
    account.balance_amount = account.balance_amount.to_f + params[:amount].to_f
    account.save!

  rescue ActiveRecord::RecordNotFound => e
    @errors = { error: "Couldn't find destination account with id: #{params[:destination_account_id]}" }
    raise ActiveRecord::RecordNotFound
  end

  def create_transfer
    @transfer = Transfer.new(transfer_params_formated)
    @transfer.save!

  rescue ActiveRecord::RecordInvalid
    @errors = transfer.errors.messages
    raise ActiveRecord::RecordInvalid
  end

  def transfer_params_formated
    {
      amount: params[:amount],
      source_account_id: @current_account.id,
      destination_account_id: params[:destination_account_id]
    }
  end

  def trasfer_params
    params.permit(:amount, :destination_account_id)
  end
end
