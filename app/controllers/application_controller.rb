class ApplicationController < ActionController::API
  def authenticate_account!
    head :unauthorized unless current_account
  end

  def current_account
    return @current_account if @current_account

    header = request.headers['Authorization']&.split(' ')&.last
    return nil if header.nil?

    decoded_payload = JsonWebToken.decode(header)
    @current_account = Account.find decoded_payload[:account_id]
  end
end
