require 'rails_helper'

RSpec.describe 'V1::Accounts', type: :request do
  describe 'POST /v1/accounts' do
    let(:account) { build :account }
    let(:valid_attributes) { attributes_for(:account) }

    context 'when request is valid' do
      before { post '/v1/accounts', params: valid_attributes }

      it { expect(response).to have_http_status(201) }
      it { expect(json['token']).not_to be_nil   }
      it { expect(JsonWebToken.decode(json['token'])[:account_id]).to eq json['id'] }
    end

    context 'when request is invalid' do
      before { post '/v1/accounts', params: {} }

      it { expect(response).to have_http_status(422) }
    end
  end
end
