namespace :environment do
  task :common do
    set :image, 'postgres'
    set :tag, '9.4.1'
    set :restart_policy_name, "always"

    env_vars POSTGRES_USER: "postgresql"
    env_vars POSTGRES_PASSWORD: "supersecret"

    host_port 25432, container_port: 5432
    host_volume "/opt/example/postgres", container_volume: "/var/lib/postgresql/data"
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
