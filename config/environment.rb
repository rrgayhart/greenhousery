# Load the Rails application.
require File.expand_path('../application', __FILE__)

Mime::Type.register "rb", :rb

# Initialize the Rails application.
Greenhousery::Application.initialize!
