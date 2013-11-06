require 'sinatra'
require 'data_mapper'

env = ENV["RACK_ENV"] || "development"
DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{env}")
require_relative 'link'
# After declaring your models, you should finalise them
DataMapper.finalize

# However, how database tables don't exist yet. Let's tell datamapper to create them
DataMapper.auto_upgrade!

class Bookmarker < Sinatra::Base
	set:views, File.join(File.dirname(__FILE__), '..', 'views')
	
	get '/' do
		@links = Link.all
		erb :index
	end

	get '/links' do
		@links = Link.all
		erb :links
	end

	post '/links' do 
		url = params["url"]
		title = params ["title"]
		description = params ["description"]
		Link.create(:url => url, :title => title, :description => description)
		redirect to('/')
	end


	get '/login' do
		@login_page = true
		erb :login
	end

	get '/signup' do
		erb :signup
	end

	get '/hello' do
		"Welcome back"
	end

	get '/register' do 
		erb :register
	end


end
