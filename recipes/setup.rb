case node['platform_family']
when 'rhel', 'fedora'
  # centos php compiled with curl
when 'debian'
  package 'php5-intl' do
    action :install
  end
end

execute 'export-timezone' do
   command "export TZ=America/Sao_Paulo"
   action :nothing
 end
 
file '/etc/timezone' do
  owner "root"
  group "root"
  mode "00644"
  content 'America/Sao_Paulo'
  notifies :run, "execute[export-timezone]", :immediately
end
