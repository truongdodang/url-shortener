# frozen_string_literal: true

module Api
  module V1
    class UrlsController < ApplicationController
      before_action :authorize_request

      def create
        url = Url.new(url_params.merge(user_id: current_user&.id))

        if url.save
          render json: { original_url: url.original_url,
                         short_url: base_url + Url.encode(url.id) }, status: :ok
        else
          render json: { errors: url.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def url_params
        params.permit(:original_url)
      end

      def base_url
        "#{request.base_url}/"
      end
    end
  end
end
