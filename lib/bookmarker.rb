require 'sinatra'
require 'data_mapper'
require 'rack-flash'



env = ENV["RACK_ENV"] || "development"
DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{env}")
require_relative 'link'
require_relative 'tag'
require_relative 'user'
# After declaring your models, you should finalise them
DataMapper.finalize

# However, how database tables don't exist yet. Let's tell datamapper to create them
DataMapper.auto_upgrade!

class Bookmarker < Sinatra::Base
		set:views, File.join(File.dirname(__FILE__), '..', 'views')
		use Rack::Flash
		# use Rack::MethodOverride
		

		enable :sessions
		set :session_secret, 'super secret'
		
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
	    	redirect to('/tags')
	   	end

		get '/login' do
			@login_page = true
			erb :login
		end

		get '/user/new' do
			@user = User.new
			erb :signup
		end

		post '/users' do
  			@user = User.new(:email => params[:email],
    	    			:password => params[:password],
    	    			:password_confirmation => params[:password_confirmation])
  			if @user.save	
  				session[:user_id] = @user.id
	 			redirect to('/')
	 		else
				flash.now[:errors] = @user.errors.full_messages	 			
				erb :signup
	 		end
		end

		get '/sessions/new' do
 		 	erb :"sessions/new"
		end

		post '/sessions' do
			 email, password = params[:email], params[:password]
			 user = User.authenticate(email, password)
			 if user
			   session[:user_id] = user.id
			   redirect to('/')
			 else
			   flash[:errors] = ["The email or password are incorrect"]
			   erb :"sessions/new"
			 end
		end

	helpers do
 		def current_user    
    		@current_user ||=User.get(session[:user_id]) if session[:user_id]
 		end
	end

end
