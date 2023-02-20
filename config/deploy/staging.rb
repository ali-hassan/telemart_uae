set :stage, :production
ask :branch, "master"

server 'ubuntu@52.221.186.207', user: 'ubuntu', roles: %w{web app db}, my_property: :my_value

server '52.221.186.207',
       user: 'ubuntu',
       roles: %w{web app db},
       ssh_options: {
         user: fetch(:user),
         forward_agent: true,
         auth_methods: %w(publickey password)
       }

set :rails_env, "production"
set :puma_env, "production"
set :puma_config_file, "#{shared_path}/config/puma.rb"
set :puma_conf, "#{shared_path}/config/puma.rb"