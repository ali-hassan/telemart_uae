#!/usr/bin/env puma

directory '/home/ubuntu/www/var/marketplace/telemart_uae'
rackup "/home/ubuntu/www/var/marketplace/telemart_uae/config.ru"
environment 'production'

tag ''

#pidfile "/home/ubuntu/www/var/marketplace/telemart_uae/tmp/pids/puma.pid"
pidfile "/tmp/puma.pid"
state_path "/home/ubuntu/www/var/marketplace/telemart_uae/tmp/pids/puma.state"
stdout_redirect '/home/ubuntu/www/var/marketplace/telemart_uae/log/puma.access.log', '/home/ubuntu/www/var/marketplace/telemart_uae/log/puma.error.log', true


threads 4,16



#bind 'unix:///tmp/puma.sock'
bind "unix:///tmp/puma.sock"
workers 3




restart_command 'bundle exec puma'


preload_app!


on_restart do
  puts 'Refreshing Gemfile'
  ENV["BUNDLE_GEMFILE"] = ""
end


before_fork do
  ActiveRecord::Base.connection_pool.disconnect!
end

on_worker_boot do
  ActiveSupport.on_load(:active_record) do
    ActiveRecord::Base.establish_connection
  end
end

