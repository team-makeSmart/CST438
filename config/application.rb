require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ExpenseTrackerDesktop
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.time_zone = "Pacific Time (US & Canada)"
    config.active_record.default_timezone = :utc # Or  local
    config.action_controller.allow_forgery_protection = false
  end
end
