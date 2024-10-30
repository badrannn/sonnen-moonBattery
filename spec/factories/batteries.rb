FactoryBot.define do
  factory :battery do
    serial_number { Faker::Internet.uuid }
    mac_address { Faker::Internet.mac_address }
    last_ping_at { Faker::Time.between(from: DateTime.now - 200, to: DateTime.now - 100) }
  end
end
