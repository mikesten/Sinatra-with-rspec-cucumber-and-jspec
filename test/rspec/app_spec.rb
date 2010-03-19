require File.dirname(__FILE__) + '/spec_helper'

describe "ClientApp" do
  include Rack::Test::Methods
  include WebMock
  
  def app
    @app ||= MyApp
  end
  
  before do
  end
  
  it "greets me" do
    get "/"
    last_response.body.should eql("mike")
  end
  
  it "shows projects" do
    projects_json = File.new(File.join(File.dirname(__FILE__), *%w[.. fixtures projects.json])).read
    stub_request(:get, /myapi.com\/projects.json/).to_return(:body => projects_json, :status => 200)
    get "/projects"
    last_response.body.should include("My exciting project")
  end
end