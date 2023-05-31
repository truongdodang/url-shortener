# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Url', type: :request do
  describe 'GET /:short_url' do
    subject(:request) { get "/#{params[:short_url]}" }

    context 'when valid params' do
      let(:user) { create :user }
      let(:url) { create :url, user:, original_url: 'http://example.com' }
      let(:params) { { short_url: Url.encode(url.id) } }

      it 'redirect to original url' do
        request

        expect(response).to have_http_status(301)
        expect(response).to redirect_to(url.original_url)
      end
    end
  end
end
