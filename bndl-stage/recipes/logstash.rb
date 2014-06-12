
include_recipe "ark"

# Create user and group
#
group node[:logstash][:agent][:group] do
  action :create
  system true
end

user node[:logstash][:agent][:user] do
  comment "logstash User"
  home    "/home/logstash"
  shell   "/bin/bash"
  gid     "logstash"
  supports :manage_home => false
  action  :create
  system true
end


ark "logstash" do
  url   node[:logstash][:agent][:source_url]
  owner node[:logstash][:agent][:user]
  group node[:logstash][:agent][:group]
  version node[:logstash][:agent][:version]
  # checksum node[:logstash][:agent][:checksum]
end

# copy config
template "/usr/local/logstash/logstash.conf" do
  source "logstash.config.erb"
  owner 'root' and mode 0666
end


template "/etc/init.d/logstash" do
  source "logstash.init.erb"
  owner 'root' and mode 0755
end

service "logstash" do
  supports :status => true, :restart => true
  action [ :enable ]
end




