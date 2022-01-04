# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative "config/application"

Rails.application.load_tasks

namespace :bundle do
  task :update do
    sh 'docker-compose exec app bundle update'
  end
end

namespace :db do
  desc 'Starts postgresql on your local machine.'
  task :up do
    sh 'brew services start postgresql'
  end

  task :r do
    sh 'brew services restart postgresql'
  end

  task :mg do
    sh 'docker-compose exec app rails db:migrate'
  end

  task :rb do
    sh 'docker-compose exec app rails db:rollback'
  end

  task :c do
    sh 'docker exec -it writing-web-app_database_1 /bin/sh'
  end

  task :s do
    sh 'docker-compose exec app rake db:seed'
  end
end

namespace :app do
    desc 'Bring the app up'
    task :up do
      sh 'docker-compose up --remove-orphans'
    end

    desc 'Tear the app down'
    task :down do
      sh 'docker-compose down'
    end

    desc 'Runs dc down then dc up. Basically a nice reset for running the app locally.'
    task :r do
      sh 'docker-compose down'
      sh 'docker-compose up --remove-orphans'
    end

    desc 'Gets you into the docker container bash prompt. Handy when you need to run a lot of commands.'
    task :sh do
      sh 'docker exec -it writing-web-app_app_1 /bin/sh'
    end

    desc 'Gets you into container\'s rails app console.'
    task :c do
      sh 'docker-compose exec app rails console'
    end

    desc 'Runs "rake routes"'
    task :routes do
      sh 'docker-compose exec app rails routes'
    end
end
