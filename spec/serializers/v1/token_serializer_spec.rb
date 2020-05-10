require 'rails_helper'

RSpec.describe V1::TokenSerializer, type: :serializer do
  it { expect(described_class.ancestors).to include ActiveModel::Serializer }

  describe 'attributes serializers' do
    let(:account) { create :account }
    let(:token_serializer) { described_class.new account }
    subject { JSON.parse token_serializer.to_json  }

    it { is_expected.to include 'name' }
    it { is_expected.to include 'token' }
  end
end
