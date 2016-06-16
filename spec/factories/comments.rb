FactoryGirl.define do
  factory :comment do
    author 'mikelangelo'
    sequence(:body) {|n| "comment body #{n}"}
  end
end