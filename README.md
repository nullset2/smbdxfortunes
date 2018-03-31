# smbdxfortunes

Recreation of the SMBDX minigame for the web.

Ruby/Sinatra

In production, this app expects a postgresql database to be accesible at whatever URL the `DATABASE_URL` environment variable is pointing at.

In development, run postgres locally on the default port with a `smbdxfortunes_development` database available.

In both cases, you can seed the databases with sample data using the sql script found in `/scripts/create_tables.sql`

Finally, just run `ruby fortune.rb` from your favorite shell.

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

WTFPL
