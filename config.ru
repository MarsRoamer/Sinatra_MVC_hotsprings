require './config/environment'



use Rack::MethodOverride

use HotspringsController
use ExplorersController
run ApplicationController