require 'rails_helper'

RSpec.describe V1::BalanceAccountSerializer, type: :serializer do
  it { expect(described_class.ancestors).to include ActiveModel::Serializer }

  describe 'attributes serializers' do
    let(:account) { create :account }
    let(:balance_account_serializer) { described_class.new account }
    subject { JSON.parse balance_account_serializer.to_json  }

    it { is_expected.to include 'name' }
    it { is_expected.to include 'balance_amount' }
  end
end
