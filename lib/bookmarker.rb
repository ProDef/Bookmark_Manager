require 'sinatra'
require 'data_mapper'

env = ENV["RACK_ENV"] || "development"
DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{env}")
require_relative 'link'
require_relative 'tag'
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
		# @links = Link.all
		erb :links
	end

	post '/links' do 
		url = params["url"]
		title = params["title"]
		description = params["description"]
		tags = params["tags"].split(' ').map do |tag|
			Tag.first_or_create(:text => tag)
		end
		Link.create(:url => url, :title => title, :description => description, :tags => tags)
		redirect to('/')
	end

	get '/tags' do 
		erb :tag_search
	end

	get '/tags/:text' do |text|
		puts text
 	 	tag = Tag.first(:text => params[:text])
   		@links = tag ? tag.links : []
 	 	erb :index
 	end

	post '/tags' do
    	tag = params["tags"]
    	tag_search = '/tags/' + tag
    	redirect to(tag_search)
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
