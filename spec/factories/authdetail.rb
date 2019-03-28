FactoryBot.define do
  factory :authdetail do
    auth_token {"qwerty"}
    status {"active"}
    user_id {"1"}
    sent_at {Time.now}
  end
end