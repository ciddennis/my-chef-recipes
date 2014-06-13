apt_package "wget" do
  action :install
end

execute 'add elastic' do
  command 'wget -O - http://packages.elasticsearch.org/GPG-KEY-elasticsearch | apt-key add -'
  action :run
end

execute 'add logstash' do
  command 'wget -O - http://packages.elasticsearch.org/GPG-KEY-elasticsearch | apt-key add -'
  action :run
end

execute 'add source list' do
  command 'echo "deb http://packages.elasticsearch.org/logstash/1.4/debian stable main" >> /etc/apt/sources.list.d/logstash.list'
  action :run
end

execute 'add source list' do
  command 'echo "deb http://packages.elasticsearch.org/elasticsearch/1.1/debian stable main" >> /etc/apt/sources.list.d/elastic.list'
  action :run
end

execute 'update apt' do
  command 'apt-get update'
  action :run
end

apt_package "openjdk-7-jdk" do
  action :install
end

apt_package "ntp" do
  action :install
end

apt_package "imagemagick" do
  action :install
end

apt_package "libxml2-dev" do
  action :install
end

apt_package "libxslt-dev" do
  action :install
end

apt_package "redis-server" do
  action :install
end

apt_package "postgresql-9.1" do
  action :install
end

apt_package "postgresql-contrib-9.1" do
  action :install
end

apt_package "postgresql-server-dev-9.1" do
  action :install
end

apt_package "postgresql-client-9.1" do
  action :install
end


template "/etc/postgresql/9.1/main/pg_hba.conf" do
  source "pg_hba.conf.erb"
  owner 'postgres' and mode 0444
  group 'postgres'
end

service "postgresql" do
  action :restart
end


apt_package "elasticsearch" do
  action :install
end


execute 'create database' do
  command 'echo "create database bndl_development" | psql'
  user "postgres"
  group "postgres"
  action :run
end


execute 'elastic search runlevel' do
  command 'update-rc.d elasticsearch defaults'
  action :run
end

service "elasticsearch" do
  action :start
end




execute 'install logstash' do
  command 'apt-get -y install logstash'
  action :run
end

template "/etc/logstash/conf.d/bndl.conf" do
  source "logstash.config.erb"
  owner 'root' and mode 0666
end

service "logstash" do
  action :start
end

