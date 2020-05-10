require 'rails_helper'

RSpec.describe Account, type: :model do
  it { expect(described_class.ancestors).to include ApplicationRecord }

  context 'validates' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_length_of(:name).is_at_most(50) }
    it { should validate_presence_of(:password_digest) }
    it do
      should validate_numericality_of(:balance_amount).
        is_greater_than_or_equal_to(0)
    end
  end
end
