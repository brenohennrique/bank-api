require 'rails_helper'

RSpec.describe 'V1::Transfers', type: :request do
  describe 'POST /v1/transfers' do
    let!(:account) { create(:account, balance_amount: 1000) }
    let!(:destination_account) { create(:account) }
    let(:valid_attributes) do
      { destination_account_id: destination_account.id, amount: 500 }.as_json
    end

    context 'when request is valid' do
      before { post '/v1/transfers', headers: valid_headers, params: valid_attributes }

      it { expect(response).to have_http_status(201) }
    end

    context 'when request is invalid' do
      let(:invalid_attributes) do
        { destination_account_id: destination_account.id, amount: 1500 }.as_json
      end
      before { post '/v1/transfers', headers: valid_headers, params: invalid_attributes }

      it { expect(response).to have_http_status(422) }
    end

    context 'when destination account is invalid' do
      let(:invalid_attributes) do
        { destination_account_id: nil, amount: 500 }.as_json
      end
      before { post '/v1/transfers', headers: valid_headers, params: invalid_attributes }

      it { expect(response).to have_http_status(422) }
    end

    context 'when not send params' do
      before { post '/v1/transfers', headers: valid_headers, params: {} }

      it { expect(response).to have_http_status(422) }
    end

    context 'when not sent authentication' do
      before { post '/v1/transfers', headers: invalid_headers, params: valid_attributes }

      it { expect(response).to have_http_status(401) }
    end
  end
end
