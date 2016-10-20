FactoryGirl.define do
  factory :game do
    date "2016-10-01"
    buy_in 1
    time_played Time.current.in_time_zone("Eastern Time (US & Canada)")
    season
  end
end
