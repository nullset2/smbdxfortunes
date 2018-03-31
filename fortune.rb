require "sinatra"
require "sinatra/reloader" if development?
require "pg"
require "byebug"

db_params = {
  dbname: "smbdxfortunes_development",
  port: 5432
}

#Root
get "/" do
  File.read(File.join('public', 'index.html'))
end

#Result
get "/result" do
  val = rand

  @type = 1 if val <= 0.05
  @type = 2 if val > 0.05 && val <= 0.20
  @type = 3 if val > 0.20 && val <= 0.40
  @type = 4 if val > 0.40 && val <= 0.70
  @type = 5 if val > 0.70

  @conn = PG::Connection.new(db_params)
  @result = @conn.exec_params("SELECT type_id, content FROM Fortunes WHERE type_id=$1 ORDER BY RANDOM() LIMIT 1", [@type])
  erb :result
end
