# Rack from scratch

Tutorial: https://www.youtube.com/watch?v=MHYMObuEahc

Use rackup to start a server on default port 9292

Rack::Reloader - Reload the application automatically after user does some changes to class.

0 is used because Rack::Reloader reload time is default 10 sec.

require "greeter" will only work if we use "rackup -Ilib" command to create a server. Ilib will help locate the greeter class.

Rack::Responses will do status:200 and will render the file

Define render method

path = File.expand_path("../views/#{template}", __FILE__) <- this will provide file path

ERB.new(File.read(path)).result(binding) <- binding is used to include all the methods 


		
		request = Rack::Request.new(env) <- we make a request for same status: 200

		case request.path <- request vairable will ask for the path from the brwoser

		when "/" then Rack::Response.new(render('index.html.erb'))

		else Rack::Response.new("Not found", 400)
		end



when "/change" then Rack::Response.new(request.params["name"])    will show name 


use Rack::Auth::Basic do |username,password|
	password=="secret"
end 

use this for authentication