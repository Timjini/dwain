class Users::SessionsController < Devise::SessionsController
  # Custom code for User SessionsController

  # Specify custom view path
  prepend_view_path 'app/views/users'
end
