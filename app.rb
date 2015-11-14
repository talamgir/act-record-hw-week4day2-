require 'active_record'
require 'sinatra'
require 'sinatra/activerecord'
require 'rack-flash'
require './models'

set :database, "sqlite3:db/database.sqlite3"

enable :sessions
use Rack::Flash

get '/' do 
	erb :index
end

post '/president' do

	@president = President.create(fname: params[:first_name], lname: params[:last_name])

	last_name = params[:last_name]
	session[ :last] = "#{last_name}"

	flash[:notice] = "President successfully created"

	redirect to ("/president")
end

get '/president' do

	@presidents = President.all

	@last = session.delete(:last)

	erb :confirmation
end


