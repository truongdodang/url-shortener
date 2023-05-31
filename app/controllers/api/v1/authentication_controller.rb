module Api
  module V1
    class AuthenticationController < ApplicationController
      before_action :authorize_request, except: :request_access

      def request_access
        user = User.find_by_email(params[:email])
        if user&.authenticate(params[:password])
          token = JsonWebToken.encode(user_id: user.id)
          time = Time.zone.now + 24.hours.to_i
          render json: { token:, exp: time.strftime('%m-%d-%Y %H:%M'),
                         email: user.email }, status: :ok
        else
          render json: { error: 'Invalid credentials' }, status: :unauthorized
        end
      end

      # def revoke_access
      # end
    end
  end
end
