require 'rails_helper'

RSpec.describe V1::TransferSerializer, type: :serializer do
  it { expect(described_class.ancestors).to include ActiveModel::Serializer }

  describe 'attributes serializers' do
    let(:transfer) { create :transfer }
    let(:transfer_serializer) { described_class.new transfer }
    subject { JSON.parse transfer_serializer.to_json  }

    it { is_expected.to include 'amount' }
    it { is_expected.to include 'source_account_id' }
    it { is_expected.to include 'destination_account_id' }
  end
end
