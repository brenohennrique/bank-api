require 'rails_helper'

RSpec.describe Transfer, type: :model do
  it { expect(described_class.ancestors).to include ApplicationRecord }

  context 'associations' do
    it { is_expected.to belong_to(:source_account) }
    it { is_expected.to belong_to(:destination_account) }
  end

  context 'validates' do
    it { should validate_numericality_of(:amount).allow_nil }
  end
end
