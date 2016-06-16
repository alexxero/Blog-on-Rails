FactoryGirl.define do
  factory :article do
    title "Article title"
    text "Article text"


    #создаём фабрику с названием article with comments для создания статьи с комментариями
    factory :article_with_comments do
      after :create do |article, evaluator|
        #после создания фабрики создаём список из 3 комментариев
        create_list :comment, 3, article: article
      end
    end
  end
end