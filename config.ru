require "greeter"

use Rack::Reloader, 0
use Rack::Auth::Basic do |username,password|
	password=="secret"
end 

run Greeter