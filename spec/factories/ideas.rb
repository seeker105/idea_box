FactoryGirl.define do
  factory :idea do
    title { generate(:title)}
    body { generate(:body) }
    quality 0
  end

  sequence :title do |var|
    "title-#{var}"
  end

  sequence :body do |var|
    "body-#{var}"
  end
end
