ENV["RACK_ENV"] = "test"
require File.join(File.dirname(__FILE__), *%w[.. .. app.rb])

require 'rubygems'
require 'sinatra'
require 'rack/test'
require 'spec'
require 'spec/autorun'
require 'spec/interop/test'
require 'webmock/rspec'

set :run, false
set :raise_errors, true
set :logging, false