# config.ru
# http://stackoverflow.com/questions/9896216/deploy-sinatra-app-on-heroku

require "./app"
$:.unshift File.expand_path("../", __FILE__)
require 'rubygems'
require 'sinatra'
require './web'
run Sinatra::Application
run Post.new
