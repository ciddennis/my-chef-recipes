
template "/srv/www/bndl/shared/config/database.yml" do
  source "database.yaml.erb"
  owner 'deploy' and mode 0666
end


# /etc/postgresql/9.1/main/pg_hba.conf


# local   all             postgres                                peer
#
# # TYPE  DATABASE        USER            ADDRESS                 METHOD
#
# # "local" is for Unix domain socket connections only
# local   all             all                                     peer
# # IPv4 local connections:
# host    all             all             127.0.0.1/32            md5
# # IPv6 local connections:
# host    all             all             ::1/128                 md5
# # Allow replication connections from localhost, by a user with the
# # replication privilege.
# #local   replication     postgres                                peer
# #host    replication     postgres        127.0.0.1/32            md5
# #host    replication     postgres        ::1/128                 md5
