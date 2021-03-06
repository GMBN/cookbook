case node['platform_family']
when 'rhel', 'fedora'
  # centos php compiled with curl
when 'debian'
  package 'php5-intl' do
    action :install
  end
  package 'libapache2-modsecurity' do
    action :install
  end
  package 'libapache2-mod-evasive' do
    action :install
  end
   package 'tzdata' do
    action :install
  end
  execute "update-tzdata" do
    command "dpkg-reconfigure -f noninteractive tzdata"
    action :nothing
  end
   
  file '/etc/timezone' do
    owner "root"
    group "root"
    mode "00644"
    content 'America/Sao_Paulo'
    notifies :run, "execute[update-tzdata]", :immediately
  end
end
