module RequestSpecHelper
  def json
    JSON.parse(response.body)
  end

  def token_generator(account_id)
    JsonWebToken.encode(account_id: account_id)
  end

  def expired_token_generator(account_id)
    JsonWebToken.encode({ account_id: account_id }, (Time.now.to_i - 10))
  end

  def valid_headers
    {
      "Authorization" => "Bearer #{token_generator(account.id)}"
    }
  end

  def invalid_headers
    {
      "Authorization" => nil
    }
  end
end
