server 'panel.alabs.org', user: 'yonodesperdicio', roles: %w{db web app}

set :stage, :staging
set :rails_env, 'staging' 
#set :deploy_to, '/rails/beta.yonodesperdicio.org'
set :deploy_to, '/var/www/vhosts/yonodesperdicio.org/rails/beta.yonodesperdicio.org'
set :branch, "staging"

set :rbenv_type, :user
set :rbenv_ruby, '2.2.2'


namespace :deploy do

  desc 'Start application'
  task :start do
    on roles(:app), in: :sequence, wait: 5 do
      within release_path do
        run "RAILS_ENV=staging passenger start -p 5001 -d"
      end
    end
  end

  desc 'Stop application'
  task :stop do
    on roles(:app), in: :sequence, wait: 5 do
      within release_path do
        run "RAILS_ENV=staging passenger stop -p 5001"
      end
    end
  end

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      within release_path do
        run "RAILS_ENV=staging passenger stop -p 5001"
        run "RAILS_ENV=staging passenger start -p 5001 -d"
      end
    end
  end

end
