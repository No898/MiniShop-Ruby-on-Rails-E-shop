source "https://rubygems.org"

git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.3.0"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "8.0.2"

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
# gem "sprockets-rails"

# Use sqlite3 as the database for Active Record
gem "sqlite3", "2.7.0"

# Use the Puma web server [https://gembundler.com/rails.html#puma]
gem "puma", "6.6.0"

# Use the Solid Cache an alternative to Redis, Memcached, etc. [https://github.com/rails/solid_cache]
# gem "solid_cache"

# Use the Solid Queue an alternative to Sidekiq, Resque, etc. [https://github.com/rails/solid_queue]
# gem "solid_queue"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

# Hotwire's SPA-like page accelerator [https://turbo.hotwire.dev]
gem "turbo-rails", "2.0.16"

# Hotwire's modest JavaScript framework [https://stimulus.hotwire.dev]
gem "stimulus-rails", "1.3.4"

# A respectable source-controlled CSS foundation [https://github.com/rails/tailwindcss-rails]
gem "tailwindcss-rails", "4.2.3"

# Speed up page loads by blanking out the screen before rendering a new page
# gem "solid_cable", "3.0.8"

# Reduces boot times through caching. [https://github.com/Shopify/bootsnap]
gem "bootsnap", require: false

# Use devise for authentication
gem "devise"

# Use pagy for pagination
gem "pagy"

# Use letter_opener to preview emails in the browser
gem 'letter_opener', group: :development

group :development, :test do
  # See previous versions of your models if you're using paper_trail, etc.
  # gem "paper_trail"

  # Use `console` with commands like `analyze` and `pronto`
  # gem "console"

  # Test adapter for Active Job
  # gem "activejob-test_adapter"

  # Add support for Capybara system testing and selenium driver
  gem "capybara"
  gem "selenium-webdriver"
end

group :development do
  # Stop n+1 queries
  # gem "bullet"

  # An interactive debugger that can be used anywhere in your application
  # gem "debug"

  # Show a stack trace in the browser
  # gem "better_errors"

  # Lints your code
  # gem "rubocop-rails-omakase"
end

group :test do
  # Adds support for fixtures, which are a great way to create test data
  # gem "fixture_builder"
end
