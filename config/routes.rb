Rails.application.routes.draw do
  get '/not_found', to: redirect('404.html')
  get '/server_error', to: redirect('500.html')

  namespace :api do
    scope module: :v1 do
      post '/request_access', to: 'authentication#request_access'
      # post '/revoke_access', to: 'authentication#revoke_access'
      post '/shorten', to: 'urls#create'
    end
  end
  get '/:short_url', to: 'urls#redirect'
end
