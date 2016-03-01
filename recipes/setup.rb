case node['platform_family']
when 'rhel', 'fedora'
  # centos php compiled with curl
when 'debian'
  package 'php5-intl' do
    action :install
  end
end
