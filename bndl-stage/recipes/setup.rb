execute 'install wget' do
  command 'apt-get install wget'
  action :run
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

execute 'install openjdk-7-jre-lib' do
  command 'apt-get -y install openjdk-7-jdk'
  action :run
end

execute 'install ntp' do
  command 'apt-get -y install ntp'
  action :run
end

execute 'install redis-server' do
  command 'apt-get -y install redis-server'
  action :run
end

execute 'install elastic' do
  command 'apt-get -y install elasticsearch'
  action :run
end


execute 'elastic search runlevel' do
  command 'update-rc.d elasticsearch defaults'
  action :run
end

execute 'elasticsearch start' do
  command 'service elasticsearch start'
  action :run
end


execute 'install logstash' do
  command 'apt-get -y install logstash'
  action :run
end

execute 'logstash start' do
  command 'service logstash start'
  action :run
end


# /etc/logstash/conf.d


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
