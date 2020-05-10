require 'rails_helper'

RSpec.describe 'V1::Tokens', type: :request do
  describe 'POST /v1/accounts' do
    let(:account) { create :account }
    let(:valid_credentials) do
      { name: account.name, password: account.password }.as_json
    end

    context 'when request is valid' do
      before { post '/v1/singup', params: valid_credentials }

      it { expect(response).to have_http_status(200) }
      it { expect(json['token']).not_to be_nil   }
      it { expect(JsonWebToken.decode(json['token'])[:account_id]).to eq account.id }
    end

    context 'when request is invalid' do
      before { post '/v1/singup', params: {} }

      it { expect(response).to have_http_status(401) }
    end
  end
end
