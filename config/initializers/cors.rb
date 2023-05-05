# config/initializers/cors.rb

Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins 'http://localhost:3000'
      resource '*', headers: :any, methods: [:get, :post, :patch, :put]
    end

    allow do
        origins 'https://www.chambersforsport.com/'
        resource '*', headers: :any, methods: [:get, :post, :patch, :put], credentials: true
    end
  end