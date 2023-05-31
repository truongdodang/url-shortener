# frozen_string_literal: true

class ApplicationController < ActionController::API
  attr_reader :current_user

  def authorize_request
    auth_header = request.headers['Authorization']

    if auth_header && auth_header.split(' ').first == 'Bearer'
      token = auth_header.split(' ').last
    else
      render json: { error: 'Authorization token is missing or invalid type' }, status: :unauthorized
      return
    end

    begin
      payload = JsonWebToken.decode(token)
      @current_user = User.find(payload[:user_id])
    rescue JWT::ExpiredSignature, JWT::VerificationError, JWT::DecodeError, ActiveRecord::RecordNotFound
      render json: { error: 'Invalid authorization token' }, status: :unauthorized
    rescue StandardError => e
      render json: { error: e.message }, status: :unauthorized
    end
  end
end
