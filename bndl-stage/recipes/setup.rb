execute 'install wget' do
  command 'apt-get install wget'
  action :nothing
end



execute 'add elastic' do
  command 'wget -O - http://packages.elasticsearch.org/GPG-KEY-elasticsearch | apt-key add -'
  action :nothing
end

execute 'add logstash' do
  command 'wget -O - http://packages.elasticsearch.org/GPG-KEY-elasticsearch | apt-key add -'
  action :nothing
end

execute 'update apt' do
  command 'apt-get update'
  action :nothing
end


execute 'install openjdk-7-jre-lib' do
  command 'apt-get install openjdk-7-jre-lib'
  action :nothing
end

execute 'install ntp' do
  command 'apt-get install ntp'
  action :nothing
end

execute 'install redis-server' do
  command 'apt-get install redis-server'
  action :nothing
end

execute 'install elastic' do
  command 'apt-get install elasticsearch'
  action :nothing
end

execute 'install logstash' do
  command 'apt-get install logstash'
  action :nothing
end


#
# wget -O - http://packages.elasticsearch.org/GPG-KEY-elasticsearch | apt-key add -
# deb http://packages.elasticsearch.org/logstash/1.4/debian stable main
# apt-get update
#
# wget -O - http://packages.elasticsearch.org/GPG-KEY-elasticsearch | apt-key add -
# deb http://packages.elasticsearch.org/elasticsearch/1.1/debian stable main
# apt-get update
#
# apt-get install elasticsearch
# apt-get install logstash
# apt-get install redis-server
#
