require 'rubygems'
require 'rack'
require 'minitest/autorun'

require File.expand_path("../lib/greeter", __FILE__)

describe Greeter do
	before do
		@request = Rack::MockRequest.new(Greeter)
	end

	it "returns a 404 for unknow request" do
		@request.get("/unknown").status.must_equal 400
	end

	it "/ display the name passed into the cookie" do
		@request.get("/","HTTP_COOKIE"=> "greet=Ruby").body.must_include "Hello Ruby"
	end

	it "/change sets the cookie and redirect to root" do
		response = @request.post("/change", params: {"name" => "Ruby"})
		response.status.must_equal 302
		response["Location"].must_equal "/"
		response["Set-Cookie"].must_include "greet=Ruby"
	end
end
