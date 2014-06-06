postgresql_database 'bndl_development' do
  connection(
    :host      => '127.0.0.1'
    :port      => 5432,
    :username  => 'postgres',
    :password  => node['postgresql']['password']['postgres']
  )
  action :create
end


template "/srv/www/bndl/shared/config/database.yml" do
  source "database.yaml.erb"
  owner 'deploy' and mode 0666
end


# group "postgres" do
#   action :create
#   system true
# end

# user "postgres" do
#   comment "Postgres User"
#   home    "/home/postgres"
#   shell   "/bin/bash"
#   gid     "postgres"
#   supports :manage_home => false
#   action  :create
#   system true
# end

# # FIX: Work around the fact that Chef creates the directory even for `manage_home: false`
# bash "remove the postgres user home" do
#   user    'root'
#   code    "rm -rf  /home/postgres"
#   not_if  { ::File.symlink?("/home/redis") } 
#   only_if { ::File.directory?("/home/redis") }
# end


# group "redis" do
#   action :create
#   system true
# end

# user "redis" do
#   comment "redis User"
#   home    "/home/redis"
#   shell   "/bin/bash"
#   gid     "redis"
#   supports :manage_home => false
#   action  :create
#   system true
# end

# # FIX: Work around the fact that Chef creates the directory even for `manage_home: false`
# bash "remove the redis user home" do
#   user    'root'
#   code    "rm -rf /home/redis"
#   not_if  { ::File.symlink?("/home/redis") } 
#   only_if { ::File.directory?("/home/redis") }
# end


# group "sidekiq" do
#   action :create
#   system true
# end

# user "sidekiq" do
#   comment "sidekiq User"
#   home    "/home/sidekiq"
#   shell   "/bin/bash"
#   gid     "sidekiq"
#   supports :manage_home => false
#   action  :create
#   system true
# end

# # FIX: Work around the fact that Chef creates the directory even for `manage_home: false`
# bash "remove the sidekiq user home" do
#   user    'root'
#   code    "rm -rf /home/sidekiq"
#   not_if  { ::File.symlink?("/home/sidekiq") } 
#   only_if { ::File.directory?("/home/sidekiq") }
# end




# # Create service
# #
# template "/etc/init/postgres.conf" do
#   source "postgres-init.conf.erb"
#   owner 'root' and mode 0644
# end

# template "/etc/init/redis.conf" do
#   source "redis-init.conf.erb"
#   owner 'root' and mode 0644
# end


# service "elasticsearch" do
#   supports :status => true, :restart => true
#   action [ :enable ]
# end


# postgresql_database_user 'disenfranchised' do 
# 	connection postgresql_connection_info password 'super_secret' action :create 
# end


