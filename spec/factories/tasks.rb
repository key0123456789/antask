FactoryBot.define do
  factory :task do
    name { 'テストを書く' }
    description { 'RSpec&Capybara&FactortBotを準備する' }
    user # users.rbで定義されているものを使い回す
  end
end

