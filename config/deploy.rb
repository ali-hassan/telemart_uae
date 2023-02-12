# config valid for current version and patch releases of Capistrano
lock "~> 3.11.0"

set :repo_url,        'git@github.com:ali-hassan/telemart_uae.git'
set :application,     'telemart'
set :user,            'ubuntu'
set :puma_threads,    [4, 16]
set :puma_workers,    3

# Don't change these unless you know what you're doing

set :pty,             true
# set :use_sudo,        false
# set :deploy_via,      :remote_cache
set :deploy_to,       "/home/#{fetch(:user)}/www/var/#{fetch(:application)}"
set :puma_bind,       "unix://#{shared_path}/tmp/sockets/telemart-puma.sock"
set :puma_state,      "#{shared_path}/tmp/pids/puma.state"
set :puma_pid,        "#{shared_path}/tmp/pids/puma.pid"
set :puma_access_log, "#{release_path}/log/puma.access.log"
set :puma_error_log,  "#{release_path}/log/puma.error.log"
set :whenever_identifier, ->{ "#{fetch(:application)}_#{fetch(:stage)}" }
# set :ssh_options,     { forward_agent: true, user: fetch(:user), keys: %w(~/.ssh/id_rsa.pub) }
set :puma_preload_app, true
set :puma_init_active_record, true  # Change to false when not using ActiveRecord

set :linked_files, %w{config/database.yml config/secrets.yml config/config.yml}
set :linked_dirs,  %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/reports}

append :asdf_map_ruby_bins, 'puma', 'pumactl'

namespace :puma do
  desc 'Create Directories for Puma Pids and Socket'
  task :make_dirs do
    on roles(:app) do
      execute "mkdir #{shared_path}/tmp/sockets -p"
      execute "mkdir #{shared_path}/tmp/pids -p"
    end
  end

  before :start, :make_dirs
end

namespace :deploy do
  desc "Make sure local git is in sync with remote."
  task :check_revision do
    on roles(:app) do
      unless `git rev-parse HEAD` == `git rev-parse origin/#{fetch(:branch)}`
        puts "WARNING: HEAD is not the same as origin/#{fetch(:branch)}"
        puts "Run `git push` to sync changes."
        exit
      end
    end
  end

  desc 'Initial Deploy'
  task :initial do
    on roles(:app) do
      before 'deploy:restart', 'puma:start'
      invoke 'deploy'
    end
  end

  desc 'Upload to shared/config'
  task :upload do
    on roles (:app) do
      upload! "config/database.yml", "#{shared_path}/config/database.yml"
      upload! "config/secrets.yml",  "#{shared_path}/config/secrets.yml"
    end
  end

  before :starting,  :check_revision
  before 'check:linked_files', 'puma:config'
  after  :finishing, :compile_assets
  after  :finishing, :cleanup
end

desc "Run rake db:seed on a remote server."
task :seed do
  on roles (:app) do
    within release_path do
      with rails_env: fetch(:rails_env) do
        execute :rake, "db:seed"
      end
    end
  end
end
