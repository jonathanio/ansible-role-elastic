require 'serverspec'

# Required by serverspec
set :backend, :exec

case os[:family]
when 'debian','ubuntu'
  package_name = 'elasticsearch'
  service_name = 'elasticsearch'
  config_dir = '/etc/elasticsearch'
  config_file = '/etc/elasticsearch/elasticsearch.yml'
  logging_file = '/etc/elasticsearch/elasticsearch.yml'
  config_owner = 'root'
  config_group = 'elasticsearch'
when 'redhat','centos'
  package_name = 'elasticsearch'
  service_name = 'elasticsearch'
  config_dir = '/etc/elasticsearch'
  config_file = '/etc/elasticsearch/elasticsearch.yml'
  logging_file = '/etc/elasticsearch/elasticsearch.yml'
  config_owner = 'root'
  config_group = 'elasticsearch'
else
  package_name = 'elasticsearch'
  service_name = 'elasticsearch'
  config_dir = '/etc/elasticsearch'
  config_file = '/etc/elasticsearch/elasticsearch.yml'
  logging_file = '/etc/elasticsearch/elasticsearch.yml'
  config_owner = 'root'
  config_group = 'elasticsearch'
end

describe package(package_name) do
  it { should be_installed }
end

describe file(config_dir) do
  it { should exist }
  it { should be_directory }
  it { should be_mode 750 }
  it { should be_owned_by config_owner }
  it { should be_grouped_into config_group }
end

describe file(config_file) do
  it { should exist }
  it { should be_file }
  it { should be_mode 640 }
  it { should be_owned_by config_owner }
  it { should be_grouped_into config_group }
end

describe file(logging_file) do
  it { should exist }
  it { should be_file }
  it { should be_mode 640 }
  it { should be_owned_by config_owner }
  it { should be_grouped_into config_group }
end

describe service(service_name) do
  it { should be_running }
  it { should be_enabled }
end

describe port(9200) do
  it { should be_listening.on('::').with('tcp6') }
  it { should_not be_listening.with('udp') }
end
