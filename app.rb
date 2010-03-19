require "rubygems"

gem "sinatra", "=0.9.6"
require 'sinatra/base'

gem "haml", "=2.2.21"
require 'haml'
require 'sass'

gem "nakajima-rack-flash", "=0.1.0"
require 'rack-flash'

gem "weary", "=0.7.2"
require 'weary'

class Project < Weary::Base
    format :json
    
    def show(id)
        Weary.get "http://myapi.com/projects/#{id}.json"
    end
    
    def index
      Weary.get "http://myapi.com/projects.json"
    end
    
    def self.find(id)
      self.new.show(id).perform.parse
    end
    
    def self.index
      self.new.index.perform.parse
    end
end

class MyApp < Sinatra::Base
  set :root, File.dirname(__FILE__)
  set :app_file, __FILE__
  set :views, "#{File.dirname(__FILE__)}/views"
  
  enable :methodoverride
  use Rack::Session::Cookie, :secret => "mmmmmmm, cookie"
  use Rack::Flash, :sweep => true
  
  configure do
  end
  
  helpers do
  end
  
  get '/css/:file.css' do
    content_type "text/css", :charset => "utf-8"
    response.headers['Cache-Control'] = "public, max-age=#{60*60}"
    sass "sass/#{params[:file]}".to_sym
  end
  
  get "/" do
    "mike"
  end
  
  get "/projects" do
    result = Project.index
    result.inspect
  end
  
  get "/projects/:id" do
    project = Project.find(params[:id])
    project.inspect
  end
end