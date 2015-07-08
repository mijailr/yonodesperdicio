server 'panel.alabs.org', user: 'yonodesperdicio', roles: %w{db web app}

set :stage, :production
set :rails_env, 'production' 
set :deploy_to, '/rails/yonodesperdicio.org'
set :branch, "production"

set :rbenv_type, :user
set :rbenv_ruby, '2.2.2'
