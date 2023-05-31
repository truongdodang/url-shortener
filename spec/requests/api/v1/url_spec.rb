# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Url', type: :request do
  include_context 'with right token'

  describe 'POST /api/shorten' do
    subject(:request) { post api_shorten_path, params:, headers: }

    context 'when invalid params' do
      context 'when original url is blank' do
        let(:params) { {} }

        it 'response unprocessable_entity' do
          request
          expect(response).to have_http_status(:unprocessable_entity)
          expect(JSON.parse(response.body)).to eq({ 'errors' => ["Original url can't be blank",
                                                                 'Original url is invalid'] })
        end
      end

      context 'when original url format is wrong' do
        let(:params) { { original_url: 'abc' } }

        it 'response unprocessable_entity' do
          request

          expect(response).to have_http_status(:unprocessable_entity)
          expect(JSON.parse(response.body)).to eq({ 'errors' => ['Original url is invalid'] })
        end
      end
    end

    context 'when valid params' do
      let(:params) { { original_url: 'https://www.google.com.vn' } }

      it 'response shorten url' do
        request

        expect(response).to have_http_status(:ok)
        expect(JSON.parse(response.body)).to eq({ 'original_url' => params[:original_url],
                                                  'short_url' => "#{@request.base_url}/#{Base62.encode(Url.last.id)}" })
      end
    end
  end
end
