Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'https://www.chambersforsport.com'
    resource '/contacts',
      :headers => :any,
      :methods => [:post]
  end

  allow do
    origins 'http://localhost:5000' # Replace with your frontend's base URL
    resource '*', headers: :any, methods: [:get, :post, :put, :patch, :delete, :options]
  end

  allow do
    origins 'https://www.chambersforsport.com'
    resource '/api/v1/individual_sessions', headers: :any, methods: [:get, :post, :put, :patch, :delete, :options]
  end

end