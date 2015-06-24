namespace :environment do
  task :common do
    set :image, 'hchinchilla/django-example'
    set :restart_policy_name, "always"

    env_vars PG_HOST: "%DOCKER_HOST_IP%"
    env_vars PG_PORT: "25432"
    env_vars PG_DATABASE: "postgres"
    env_vars PG_USER: "postgresql"
    env_vars PG_PASSWORD: "supersecret"

    env_vars WEB_CONCURRENCY: "5"
    env_vars TZ: "Europe/Madrid"
    env_vars DEBUG: "False"
    env_vars SECRET_KEY: "vbr3z&5310aoc3@+%a&$^"

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
