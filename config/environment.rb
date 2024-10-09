# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

Propshaft.logger = Rails.logger

