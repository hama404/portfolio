FactoryBot.define do
  factory :infomation do
    infoable_type { "MyString" }
    infoable_id { 1 }
    notice { "MyText" }
  end
end
