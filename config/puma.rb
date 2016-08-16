
environment ENV.fetch("RAILS_ENV") { "development" }

# Allow puma to be restarted by `rails restart` command.
plugin :tmp_restart
