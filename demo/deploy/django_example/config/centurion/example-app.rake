namespace :environment do
  task :common do
    set :image, 'hchinchilla/django-example'
    set :restart_policy_name, "always"

    env_vars MYSQL_HOST: "%DOCKER_HOST_IP%"
    env_vars MYSQL_PORT: "23306"
    env_vars MYSQL_DATABASE: "example"
    env_vars MYSQL_USER: "example"
    env_vars MYSQL_PASSWORD: "secret"
    env_vars MYSQL_ROOT_PASSWORD: "required"

    env_vars WEB_CONCURRENCY: "5"
    env_vars TZ: "Europe/Madrid"
    env_vars DEBUG: "False"
    env_vars SECRET_KEY: "vbr3z&5310aoc3@+%a&$^"
    env_vars MYSQL_WAIT_TIME: 0

    host_port 28080, container_port: 8080
  end
  desc 'Staging environment'
  task :staging => :common do
    set_current_environment(:staging)

    env_vars WEB_CONCURRENCY: "2"
    env_vars DEBUG: "True"

    host '188.166.94.235:2375'
  end

  desc 'Production environment'
  task :production => :common do
    set_current_environment(:production)

    env_vars WEB_CONCURRENCY: "5"

    host '188.166.94.235:2375'
  end
end
