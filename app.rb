# App.rb

require 'bundler'
Bundler.require
require './lib/spacecat.rb'

class App < Sinatra::Application
	set :database, "sqlite3:///spacecats.db"

	# list all spacecats 
	get '/spacecats' do
		@spacecats = Spacecat.order("created_at DESC")
		haml :index  
	end 

	# add a new spacecat 
	get '/spacecats/new' do
		@spacecat = Spacecat.new 
		haml :new 
	end 

	# create a new spacecat 
	post '/spacecats' do 
		@spacecat = Spacecat.new(params[:spacecat])
		if @spacecat.save 
			status 201 
			redirect '/spacecats/' + @spacecat.id.to_s
		else 
			status 400
			haml :new 
		end 
	end 

	# edit spacecat 
	get '/spacecats/edit/:id' do 
		@spacecat = Spacecat.find(params[:id])
		haml :edit 
	end 

	# update spacecat 
	put '/spacecats/:id' do 
		@spacecat = Spacecat.find(params[:id])
		if @spacecat.update(params[:id])
			status 201
			redirect '/spacecats/' + params[:id]
		else 
			status 400 
			haml :edit 
		end 
	end 

	# delete spacecat confirmation 
	get '/spacecats/delete/:id' do 
		@spacecat = Spacecat.find(params[:id])
		haml :delete 
	end 

	# delete spacecat 
	delete '/spacecats/:id' do 
		Spacecat.find(params[:id]).destroy
		redirect '/spacecats'
	end 

	# show spacecat 
	get '/spacecats/:id' do 
		@spacecat = Spacecat.find(params[:id])
		haml :show 
	end 

end 