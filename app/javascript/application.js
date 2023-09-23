// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
//= require sweetalert2

import { Turbo } from "@hotwired/turbo-rails"
import "controllers"
import "./controllers/hello_controller.js"
import "./controllers/training_table_controller.js"

Turbo.start()


// Turbo.session.drive = false