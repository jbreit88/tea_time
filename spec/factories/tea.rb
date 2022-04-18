FactoryBot.define do
  factory :tea do
    title { Faker::Beer.name }
    description { Faker::Lorem.paragraph(sentence_count: 3) }
    temperature { Faker::Number.between(from: 100, to: 210) }
    brew_time { Faker::Number.between(from: 60, to: 300) }
  end
end
