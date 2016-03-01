include_recipe 'deploy'

node[:deploy].each do |app_name, deploy|
  directory "#{deploy[:deploy_to]}/current/data/DoctrineORMModule/Proxy" do
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
  
 execute 'permissao' do
   command "chmod -R 775 #{deploy[:deploy_to]}/{current/public/correspondentes,current/data}"
   action :run
 end
  
end
