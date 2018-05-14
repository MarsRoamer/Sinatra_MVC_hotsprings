class ApplicationController < Sinatra::Base
  
  register Sinatra::ActiveRecordExtension
  enable :sessions
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }


  get '/' do 


    if logged_in?
      @explorer = session[:user_id]


  	  erb :'/explorers/index'

    else
      erb :index
    end 
  end

  helpers do

    def logged_in?
        !!session[:user_id]
    end

    def current_user
        Explorer.find(session[:user_id].id)
    end
      
  end





end