# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :test_run do
    server_id 1
    test_id 1
    result false
    log "MyText"
  end
end
