
template "/srv/www/bndl/shared/config/database.yml" do
  source "database.yaml.erb"
  owner 'deploy' and mode 0666
end




# tail -f `ps -aef|grep tee  |grep -v grep|cut -c54-190`