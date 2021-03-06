source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '>= 5.0.0', '< 5.1'
# Use sqlite3 as the database for Active Record
gem 'pg'
# Use Puma as the app server
gem 'puma'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

#gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5.x'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
# gem 'rails_12factor', group: :production
gem 'devise',      '> 4.x'
gem 'bower-rails'
gem "paperclip", git: "git://github.com/thoughtbot/paperclip.git"
gem 'stripe', git: 'https://github.com/stripe/stripe-ruby'
gem 'tinymce-rails-imageupload', '~> 3.5.8'
gem 'stripe_event'
gem 'gibbon'

gem 'docverter'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'activeadmin', github: 'activeadmin'
gem 'active_admin_editor', github: 'ejholmes/active_admin_editor'

# Active admin Rails 5 Depencecies
gem 'ransack',    github: 'activerecord-hackery/ransack'
gem 'kaminari' #,   github: 'amatsuda/kaminari', branch: '0-17-stable'
gem 'formtastic', github: 'justinfrench/formtastic'
gem 'draper',     github: 'audionerd/draper', branch: 'rails5', ref: 'e816e0e587'
# To fix a Draper deprecation error
gem 'activemodel-serializers-xml', github: 'rails/activemodel-serializers-xml'
# Optional -- only if you already include these gems
#gem 'rack-mini-profiler',          github: 'MiniProfiler/rack-mini-profiler'
gem 'paper_trail'

gem 'inherited_resources', github: 'activeadmin/inherited_resources'
gem 'valid_url'
gem "font-awesome-rails"
gem 'ionicons-rails'
gem 'rake', '< 11.0'

gem 'capistrano', '~> 3.4.0'
gem 'capistrano-bundler', '~> 1.1.2'
gem 'capistrano-rails', '~> 1.1.1'
gem 'capistrano-rvm', github: "capistrano/rvm"
gem 'capistrano-rails-console', require: false
gem 'listen', '~> 3.0.5'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'rspec-rails', "3.5.0.beta1"
  gem 'poltergeist'
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'teaspoon-jasmine'
  gem 'faker'
  gem "rails-controller-testing", :git => "https://github.com/rails/rails-controller-testing"
  gem "stripe-ruby-mock"
end

group :development do
  gem 'rails_best_practices'
  gem 'brakeman'
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'meta_request'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]



