source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "rails", "~> 5.1.4"
gem "puma", "~> 3.7"
gem "jquery-rails"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "coffee-rails", "~> 4.2"
gem "turbolinks", "~> 5"
gem "jbuilder", "~> 2.5"
gem "devise"
gem "simple_token_authentication"
gem "config"
gem "bootstrap-sass"
gem "i18n-js", ">= 3.0.0.rc11"
gem "font-awesome-rails"
gem "highcharts-rails"

group :development, :test do
  gem "mysql2", ">= 0.3.18", "< 0.5"
  gem "better_errors"
  gem "brakeman", require: false
  gem "bundler-audit"
  gem "database_cleaner"
  gem "fabrication"
  gem "guard-rspec", require: false
  gem "rails_best_practices"
  gem "reek"
  gem "rspec"
  gem "rspec-rails", "~> 3.6"
  gem "rspec-collection_matchers"
  gem "rubocop", require: false
  gem "rubocop-checkstyle_formatter", require: false
  gem "scss_lint", require: false
  gem "scss_lint_reporter_checkstyle", require: false
  gem "spring"
end

group :development do
  gem "listen", "~> 3.1.5"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "rack-mini-profiler"
  gem "pry"
  gem "pry-rails"
  gem "pry-byebug"
  gem "web-console", "~> 2.0"
  gem "letter_opener"
  gem "faker"
  gem "i18n-tasks", "~> 0.8.7"
  gem "bullet"
  gem "railroady"
  gem "figaro"
end

group :test do
  gem "shoulda-matchers", "~> 3.0"
  gem "simplecov", require: false
  gem "simplecov-rcov", require: false
  gem "simplecov-json"

  gem "cucumber-rails", require: false
  gem "selenium-webdriver"
  gem "chromedriver-helper"
  gem "capybara"
end

group :production do
  gem "rails_12factor"
  gem "pg"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem "mini_racer", platforms: :ruby
