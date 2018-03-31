require "sinatra"
require "sinatra/reloader" if development?
require "pg"
require "byebug"

db = URI.parse(ENV["DATABASE_URL"] || "postgres://localhost/smbdxfortunes_development")

db_params = {
  host: db.host,
  user: db.getUserInfo().split(":")[0],
  password: db.getUserInfo().split(":")[1],
  database: db.database
}

@conn = PG::Connection.new(db_params)

#Root
get "/" do
  File.read(File.join('public', 'index.html'))
end

#Result
get '/result' do
  @val = rand

  @type = 1 if @val.between?(0.00,0.05)
  @type = 2 if @val.between?(0.05,0.20)
  @type = 3 if @val.between?(0.20,0.40)
  @type = 4 if @val.between?(0.40,0.70)
  @type = 5 if @val.between?(0.70,1.00)

  @conn.exec_params("SELECT * FROM Fortunes WHERE type_id=$1 ORDER BY RANDOM() LIMIT 1", [@type])

  erb :result
end
