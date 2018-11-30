require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'

db = SQLite3::Database.new('chuck.db')

get "/fact" do
    @rows = db.execute("SELECT * FROM facts")
    fact_no = rand(@rows.length)
    @fact = @rows[fact_no][1]
    
    if params[:response] == 'YES'
        erb :yes
    elsif params[:response] == 'NO'
        erb :no
    elsif params[:response] == 'ALL'
        erb :all
    end
end

get '/' do
    erb :form
end