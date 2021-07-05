# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative "config/application"

Rails.application.load_tasks

namespace :db do
  desc 'Starts postgresql on your local machine.'
  task :up do
    sh 'brew services start postgresql'
  end
end

desc 'Runs dc down then dc up. Basically a nice reset for running the app locally.'
task :r do
  sh 'docker-compose down'
  sh 'docker-compose up --remove-orphans'
end

desc 'Gets you into the docker container bash prompt. Handy when you need to run a lot of commands.'
task :sh do
end

desc 'Gets you into container\'s rails app console.'
task :c do
  sh 'docker-compose exec app rails console'
end

