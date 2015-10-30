source 'https://rubygems.org'
# ALWAYS RUN # bundle AFTER MODIFYING Gemfile!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

# no need to run: gem install rails -v 4.2.4, etc
# because if the gem is not installed for your ruby version
# bundler will install it for you!
gem "bootstrap-sass"
gem "cowsay"

# gem 'uglierfier', '>= 1.3.0'
# 1. Bundler will look in installed gems for a gem that qualifies the criteria given
  # (uglifier gem with version > 1.3.0)
# 2. If the gem is not found, Bundler will install the latest gem version that qualifies from the source
  # (https://rubygems.org)
# 3. Bundler will update Gemfile.lock with that version ****
  # This means that if you pass your app to another developer,
  # they will install the exact same version of uglifier as you

gem "faker"
  # if no version specified, it will use the latest from your Ruby installation
  # If you don't have the gem installed, then it will install the latest

# Bundler will require all the gems by default for your environment
# unless you specify option: require: false
# sometimes there are gems you need in development but not in production
# eg debugging gem 'byebug', 'web-console', 'spring'
# can also put in groups to specify environment
# or:
# gem "awesome_print", group: :development


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.4' # require:false
# Use postgresql as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # we use the three gems below for a nicer Rails console display
  gem "hirb"
  gem "awesome_print"
  gem "interactive_editor"

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end
