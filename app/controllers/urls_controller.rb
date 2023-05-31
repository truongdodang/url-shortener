class UrlsController < ApplicationController
  def redirect
    id = Url.decode(params[:short_url])
    url = Url.find(id)
    redirect_to url.original_url, allow_other_host: true, status: 301
  rescue ActiveRecord::RecordNotFound
    redirect_to not_found_url
  rescue StandardError
    redirect_to server_error_url
  end
end
