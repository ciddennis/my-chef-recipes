
template "/srv/www/bndl/shared/config/database.yml" do
  source "database.yaml.erb"
  owner 'deploy' and mode 0666
end


