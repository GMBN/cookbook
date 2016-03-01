include_recipe 'deploy'

node[:deploy].each do |app_name, deploy|
  directory "#{deploy[:deploy_to]}/current/data" do
    recursive true
    user deploy[:user]
    group deploy[:group]
    mode 0775
    action :create
  end
  
  directory "#{deploy[:deploy_to]}/current/public/correspondentes/img/thumbnail/150x130" do
    recursive true
    user deploy[:user]
    group deploy[:group]
    mode 0775
    action :create
  end
  
 directory "#{deploy[:deploy_to]}/current/public/correspondentes/img/original" do
    recursive true
    user deploy[:user]
    group deploy[:group]
    mode 0775
    action :create
  end
  
 file "#{deploy[:deploy_to]}/current/public/complemento/cidades.json" do
    mode 0775
    user deploy[:user]
    group deploy[:group]
    action :create
  end
  
end
