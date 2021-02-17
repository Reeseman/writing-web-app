# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative "config/application"

Rails.application.load_tasks

namespace :db do
  task :up do
    sh 'brew services start postgresql'
  end
end

task :r do
  sh 'docker-compose down'
  sh 'docker-compose up --remove-orphans'
end

task :sh do
end

task :c do
  sh 'docker-compose exec app rails console'
end

