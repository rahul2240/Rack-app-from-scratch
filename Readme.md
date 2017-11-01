# Rack from scratch

Tutorial: https://www.youtube.com/watch?v=MHYMObuEahc

Use rackup to start a server on default port 9292

Rack::Reloader - Reload the application automatically after user does some changes to class.

0 is used because Rack::Reloader reload time is default 10 sec.

require "greeter" will only work if we use "rackup -Ilib" command to create a server. Ilib will help locate the greeter class.

