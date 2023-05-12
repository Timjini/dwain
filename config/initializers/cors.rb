Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'https://www.chambersforsport.com'
    resource '/contacts',
      :headers => :any,
      :methods => [:post]
  end
end