# config valid for current version and patch releases of Capistrano
lock "~> 3.11.0"

set :application, "quillpad"
set :repo_url, "git@github.com:kumarn33/quillpad.git"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/home/deploy/quillpad"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml", "config/secrets.yml"

# Default value for linked_dirs is []
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure

# Not used now
# desc "Updload config file"
# task :upload_config do
#   on roles(:all) do
#     upload!("config/database.yml", "#{shared_path}/config/database.yml")
#     upload!("config/secrets.yml", "#{shared_path}/config/secrets.yml")
#   end
# end

desc 'Start puma server'
task :start_puma do
  on roles(:app) do
    within current_path do
      execute("bash", "--login", "start.sh")
    end
  end
end

desc 'Stop puma server'
task :stop_puma do
  on roles(:app) do
    within current_path do
      execute("kill", "-9", "$(cat tmp/pids/puma.pid)")
    end
  end
end

desc 'Health check'
task :health_check do
  system("curl -ks https://#{ENV['MY_SRV']}/status | jq")
end

desc 'Restart puma'
task :restart_puma => [:stop_puma, :start_puma, :health_check] do
  puts "Puma restarted"
end

after :deploy, :restart_puma