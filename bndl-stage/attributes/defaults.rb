node.default[:logstash] ||= {:agent => {}}


node[:logstash][:agent][:user] = "logstash"
node[:logstash][:agent][:group] = "logstash"
node[:logstash][:agent][:source_url] = "https://download.elasticsearch.org/logstash/logstash/logstash-1.4.1.tar.gz"
node[:logstash][:agent][:checksum] = "834599d28ce50012c221ece7a6783c5943221e36"
node[:logstash][:agent][:version] = "1.4.1"

node[:logstash][:agent][:inputs] = [
          {
              "redis" => {
                  "codec" => "json",
                  "data_type" => "list",
                  "key" => "events"
              }
          }
        ]

node[:logstash][:agent][:outputs] = [ {
              "elasticsearch" => {
                "host" => "localhost"
              }
            }
        ]
