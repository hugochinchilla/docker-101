namespace :environment do
  task :common do
    set :image, 'mariadb'
    set :restart_policy_name, "always"

    env_vars MYSQL_USER: "example"
    env_vars MYSQL_PASSWORD: "cjxo[p&^pdJjnqoEz&"
    env_vars MYSQL_ROOT_PASSWORD: "uL8*Pn>EMmX9iA>$W"
    env_vars MYSQL_DATABASE: "example"

    host_port 23306, container_port: 3306
    host_volume "/opt/example/mariadb", container_volume: "/var/lib/mysql"
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
