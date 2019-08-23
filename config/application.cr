# About Application.cr File
#
# This is Amber application main entry point. This file is responsible for loading
# initializers, classes, and all application related code in order to have
# Amber::Server boot up.
#
# > We recommend not modifying the order of the requires since the order will
# affect the behavior of the application.

require "amber"
require "./settings"
require "./i18n"
require "./database"
require "./initializers/**"

# Start Generator Dependencies: Don't modify.
require "../src/models/**"
# End Generator Dependencies

require "../src/controllers/application_controller"
require "../src/controllers/**"
require "./routes"

Amber::Server.configure do |settings|
  settings.host = "0.0.0.0"
  settings.port = ENV["PORT"].to_i if ENV["PORT"]?
end
