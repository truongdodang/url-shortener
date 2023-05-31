# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Url, type: :model do
  describe 'validation' do
    let!(:user) { create :user }

    context 'when has valid data' do
      let(:valid_object) { build(:url, user:) }

      it 'creates a new url' do
        expect { valid_object.save! }.to change { Url.count }.by 1
      end
    end

    context 'when has invalid data' do
      context 'when original url is blank' do
        let(:invalid_object) { build(:url, user:, original_url: nil) }

        it 'fails validation' do
          expect do
            invalid_object.save!
          end.to raise_error(ActiveRecord::RecordInvalid,
                             "Validation failed: Original url can't be blank, Original url is invalid")
        end
      end

      context 'when original url is not url' do
        let(:invalid_object) { build(:url, user:, original_url: 'abc') }

        it 'fails validation' do
          expect do
            invalid_object.save!
          end.to raise_error(ActiveRecord::RecordInvalid,
                             'Validation failed: Original url is invalid')
        end
      end
    end
  end
end
