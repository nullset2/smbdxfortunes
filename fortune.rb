require 'sinatra'
require 'sinatra/reloader' if development?
require 'sqlite3'

set :static, true

get '/smbdxfortunes' do
  File.read(File.join(settings.public_folder, 'index.html'))
end

get '/smbdxfortunes/result' do
  val = rand

  @type = 1 if val <= 0.05
  @type = 2 if val > 0.05 && val <= 0.20
  @type = 3 if val > 0.20 && val <= 0.40
  @type = 4 if val > 0.40 && val <= 0.70
  @type = 5 if val > 0.70

  begin
	  db = SQLite3::Database.open 'smbdxfortunes.db'
      stm = db.prepare 'SELECT content FROM Fortunes WHERE type_id=? ORDER BY RANDOM() LIMIT 1'
	  stm.bind_param 1, @type
	  @result = stm.execute
      erb :result
  rescue SQLite3::Exception => e
    return e
  ensure
	  stm.close if stm
	  db.close if db
  end
end
