include_recipe 'postgresql::ruby'

postgresql_database 'bndl_development' do
  connection(
    :host      => 'localhost'
  )
  action :create
end


template "/srv/www/bndl/shared/config/database.yml" do
  source "database.yaml.erb"
  owner 'deploy' and mode 0666
end



