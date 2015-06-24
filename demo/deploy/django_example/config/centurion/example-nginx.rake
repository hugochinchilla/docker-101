namespace :environment do
  task :common do
    set :image, ''
    set :restart_policy_name, "always"

    env_vars GUNICORN_PORT_8080_TCP_ADDR: "%DOCKER_HOST_IP%"
    env_vars GUNICORN_PORT_8080_TCP_PORT: 28080

    host_port 80, container_port: 80
  end

  desc 'Staging environment'
  task :staging => :common do
    set_current_environment(:staging)

    host '188.166.94.235:2375'
  end

  desc 'Production environment'
  task :production => :common do
    set_current_environment(:production)

    host '188.166.94.235:2375'
  end
end
