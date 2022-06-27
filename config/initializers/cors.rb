Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*'
    # All asset requests should be to rails prefixed assets paths
    # served from the asset pipeline (e.g.: "/assets/*" by default)
    # https://developer.mozilla.org/en-US/docs/Web/HTTP/Access_control_CORS#Preflighted_requests
    resource "#{Rails.application.config.assets.prefix}/*",
             headers: :any,
             methods: [:get, :options]
    # Allow active storage to be access from outside the main app
    resource '/rails/active_storage/*',
             headers: :any,
             methods: [:get, :put, :options]
  end
end
