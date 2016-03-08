case node['platform_family']
when 'rhel', 'fedora'
  # centos php compiled with curl
when 'debian'
  package 'php5-intl' do
    action :install
  end
end

file '/etc/timezone' do
  owner "root"
  group "root"
  mode "00644"
  content 'America/Noronha'
  notifies :run, "execute[export-timezone]"
end

execute 'export-timezone' do
   command "export TZ=America/Noronha"
   action :run
 end
