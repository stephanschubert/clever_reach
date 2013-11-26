[![Stories in Ready](https://badge.waffle.io/jazen/clever_reach.png?label=ready)](https://waffle.io/jazen/clever_reach)  
# clever_reach

Ruby bindings for CleverReach's API

[![Stories in Ready](https://badge.waffle.io/jazen/clever_reach.png?label=ready)](http://waffle.io/jazen/clever_reach)
[![Code Climate](https://codeclimate.com/github/jazen/clever_reach.png)](https://codeclimate.com/github/jazen/clever_reach)

## Installation

In your Gemfile:

``` ruby
gem 'clever_reach'
```

## Introduction

``` ruby
require 'clever_reach'

CleverReach.configure do |config|
  config.api_key = "12345" # Replace with your API key
end

api  = CleverReach::Base.new
resp = api.client_get_details
resp.to_hash # => { :id => '12345', :first_name => 'Stephan', ... }
```
