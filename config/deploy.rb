set :application, 'yonodesperdicio.org'
set :repo_url, 'git@bitbucket.org:yonodesperdicio/yonodesperdicio.git'

# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

set :scm, :git

set :format, :pretty
set :log_level, :debug
set :pty, true

#set :deploy_via, :copy
set :deploy_via, :remote_cache

set :ssh_options, { :forward_agent => true }

set :linked_files, %w{config/database.yml config/secrets.yml config/newrelic.yml vendor/geolite/GeoLiteCity.dat}
set :linked_dirs, %w{db/sphinx log tmp/pids tmp/cache tmp/sockets tmp/cachedir vendor/bundle public/system public/legacy public/.well-known}

set :keep_releases, 5

# Logical flow for deploying an app
after  'deploy:finished',            'thinking_sphinx:index'
after  'deploy:finished',            'thinking_sphinx:restart'
after  'deploy:finished',            'deploy:restart'

namespace :deploy do

  desc 'Perform migrations'
  task :migrations do
    on roles(:db) do
      within release_path do
        with rails_env:
          fetch(:rails_env) do execute :rake, 'db:migrate'
        end
      end
    end
  end


  before :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :rake, 'nolotiro:cache:clear'
        end
      end
    end
  end

  after :finishing, 'deploy:cleanup'

end
