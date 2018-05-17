class ExplorersController < ApplicationController

	get '/signup' do 
		if logged_in?
			redirect to "/display"
		else

		erb :'explorers/signup'
		end
	end

	post '/signup' do 

		if params[:username] == "" || params[:email] == ""  || params[:password] == ""
			flash[:message] = "Error: Please fill out all inputs"
			redirect to "/signup"
		else

		    @explorer = Explorer.create(username: params[:username], email: params[:email], password: params[:password])
		    session[:user_id] = @explorer
			erb :'explorers/index'
		end
		
	end

	get '/login' do 

		erb :'explorers/login'

	end

	post '/login' do 

		@explorer = Explorer.find_by(username: params[:username])

		if 
			session[:user_id] = @explorer
			redirect to "/"
		else
			
			redirect to "/login"

		end
	end

	get '/logout' do

		if logged_in?
			session.clear
			
		end

			redirect to "/"
	end

	get '/display' do

		if logged_in?
			@explorer = session[:user_id]		
			erb :'explorers/display'
		else
			redirect to "/login"
		end

	end




end