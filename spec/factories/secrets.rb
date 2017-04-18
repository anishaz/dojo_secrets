FactoryGirl.define do
  factory :secret do
    content "This is my really big secret. Shh don't tell"
    user nil
  end
end
