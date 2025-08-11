# frozen_string_literal: true
ruby ">= 3.4"
source "https://rubygems.org"
gemspec

# Build tools

gem "rake"

group :development, :test do
  gem "rspec", "~> 3.13"
  gem "sinatra", "~> 3.1"
  gem "puma", "~> 6.4"
end

group :perf do
  gem "benchmark-ips"
  gem "patron"
  gem "curb"
end
