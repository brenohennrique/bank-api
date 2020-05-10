FactoryBot.define do
  factory :account do
    name { Faker::Internet.username(specifier: 5..8) }
    balance_amount { Faker::Number.decimal(l_digits: 3, r_digits: 2) }
    password { Faker::Internet.password(min_length: 8, max_length: 10) }
    password_confirmation { self.password }
  end
end
