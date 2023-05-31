# frozen_string_literal: true

FactoryBot.define do
  factory :url do
    user
    original_url { 'https://www.google.com' }
  end
end
