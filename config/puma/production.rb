# config/puma/production.rb
environment "production"

# UNIX Socketã¸ã®ãƒã‚¤ãƒ³ãƒ‰
tmp_path = "#{File.expand_path("../../..", __FILE__)}/tmp"
bind "unix://#{tmp_path}/sockets/puma.sock"

# ã‚¹ãƒ¬ãƒƒãƒ‰æ•°ã¨Workeræ•°ã®æŒ‡å®š
threads 3, 3
workers 2
preload_app!

# ãƒ‡ãƒ¼ãƒ¢ãƒ³åŒ–ã®è¨­å®š
# daemonize
pidfile "#{tmp_path}/pids/puma.pid"
# stdout_redirect "#{tmp_path}/logs/puma.stdout.log", "#{tmp_path}/logs/puma.stderr.log", true

# Allow puma to be restarted by `rails restart` command.
plugin :tmp_restart
