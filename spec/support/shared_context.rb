# frozen_string_literal: true

RSpec.shared_context 'with right token' do
  let(:user) { create(:user) }
  let(:token) { JsonWebToken.encode(user_id: user.id) }
  let(:headers) { { Authorization: ['Bearer', token].join(' ') } }
end
