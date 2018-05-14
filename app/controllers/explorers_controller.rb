class ExplorersController < ApplicationController

	get '/signup' do 

		erb :'explorers/signup'
	end

	post '/signup' do 

		# @explorer = Explorer.create(username: params[:username], email: params[:email], password: params[:password])
		binding.pry


		
	end




end