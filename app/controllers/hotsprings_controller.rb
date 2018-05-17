class HotspringsController < ApplicationController

	get '/hotsprings/new' do 

		if logged_in?
			erb :'hotsprings/new'
		else
			redirect to "/login"
		end

	end

	post '/hotsprings' do
		@hotspring = Hotspring.create(name: params[:name], city: params[:city], state: params[:state], directions: params[:directions], description: params[:description])
		@explorer = session[:user_id]
		@hotspring.explorer = @explorer
		@hotspring.save
		@explorer.hotsprings << @hotspring
		@explorer.save
	
		redirect to "/hotsprings/#{@hotspring.id}"
		

	end

	get '/hotsprings' do 
		@hotsprings = Hotspring.all

		erb :'hotsprings/index'
	end


	get '/hotsprings/:id/edit' do 
		@hotspring = Hotspring.find_by(id: params[:id])
		
		
		if logged_in? && current_user.id == @hotspring.explorer.id

			erb :'hotsprings/edit'
		else
			redirect to "/display"
		end

	end

	delete '/hotsprings/:id/delete' do 

		@hotspring = Hotspring.find_by(id: params[:id])
		@hotspring.delete
		redirect to "/display"



	end

		post "/:id/comment" do 
		@comment = Comment.create(comment: params[:comment])
		@comment.explorer = current_user
		current_user.comments << @comment
		@hotspring = Hotspring.find_by(id: params[:id])
		@comment.hotspring = @hotspring
		@hotspring.comments << @comment
		
		redirect to "/hotsprings/#{@hotspring.id}"



	end


	get '/hotsprings/:id' do 

		if logged_in?

			@hotspring = Hotspring.find_by(id: params[:id])
			erb :'hotsprings/show'
		else
			redirect to "/login"
		end
	end

	patch '/hotsprings/:id' do

		 @hotspring = Hotspring.find_by(id: params[:id])

		 if params[:name] != ""
		 	@hotspring[:name] = params[:name]	 	
		 end

		 if params[:city] != ""
		 	@hotspring[:city] = params[:city]
		 end

		 if params[:state] != ""
		 	@hotspring[:state] = params[:state]
		 end

		 if params[:directions] != ""
		 	@hotspring[:directions] = params[:directions]
		 end

		 if params[:description] != ""
		 	@hotspring[:description] = params[:description]
		 end

		 @hotspring.save

# 		 params["hotspring"].each do |x|
# 		 	if x[1] != nil
# 		 		key = x[0]
# 		 		value = x[1]
# 		 		@hotspring[:"#{key}"] = value
		 	
# 		 	end
# 		 	binding.pry
		 
# 		 end
# 		 @hotspring.save
		 redirect to "/hotsprings/#{@hotspring.id}"

		 binding.pry
		
	end


	






end