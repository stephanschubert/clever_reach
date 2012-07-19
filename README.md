clever_reach
============

Ruby bindings for CleverReach's API

Installation
------------

clever_reach is WORK IN PROGRESS and not yet available on Rubygems.
But you can try it out using Bundler:

``` ruby
gem 'clever_reach', git: 'git://github.com/jazen/clever_reach.git'
```

Introduction
------------

``` ruby
require 'clever_reach'

CleverReach.configure do |config|
  config.api_key = "12345" # Replace with your API key
end

api  = CleverReach::Base.new
resp = api.client_get_details
resp.to_hash # => { :id => '12345', :first_name => 'Stephan', ... }
```
