FactoryBot.define do
  factory :offer do
    advertiser_name { FFaker::NameBR.name }
    url { FFaker::Internet.http_url }
    description { FFaker::Lorem.phrase }
    start_at { Date.current }
    premium { true }
  end
end