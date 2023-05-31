# frozen_string_literal: true

hosts = {
  development: 'localhost:3000',
  staging: 'truong-minesweeper-staging.herokuapp.com',
  production: 'truong-minesweeper.herokuapp.com'
}.freeze

Rails.application.routes.default_url_options[:host] = hosts[Rails.env.to_sym]
