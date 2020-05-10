FactoryBot.define do
  factory :transfer do
    amount { Faker::Number.decimal(l_digits: 3, r_digits: 2) }
    association :source_account, factory: :account
    association :destination_account, factory: :account
  end
end
