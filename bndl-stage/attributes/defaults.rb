node.default[:logstash] ||= {:agent => {}}


default.logstash[:agent][:user] = "logstash"
default.logstash[:agent][:group] = "logstash"
default.logstash[:agent][:source_url] = "https://download.elasticsearch.org/logstash/logstash/logstash-1.4.1.tar.gz"
default.logstash[:agent][:checksum] = "834599d28ce50012c221ece7a6783c5943221e36"
default.logstash[:agent][:version] = "1.4.1"

default.logstash[:agent][:inputs] = [
          {
              "redis" => {
                  "codec" => "json",
                  "data_type" => "list",
                  "key" => "events"
              }
          }
        ]

default.logstash[:agent][:outputs] = [ {
              "elasticsearch" => {
                "host" => "localhost"
              }
            }
        ]
