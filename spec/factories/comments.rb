FactoryBot.define do
  factory :comment do
    content "MyText"
    commented_by "MyString"
    commentor_id "MyString"
    references ""
  end
end
