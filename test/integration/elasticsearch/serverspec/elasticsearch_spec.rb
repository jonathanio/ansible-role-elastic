require 'serverspec'

# Required by serverspec
set :backend, :exec

case os[:family]
when 'debian','ubuntu'
  package_name = 'elasticsearch'
  service_name = 'elasticsearch'
  config_file = '/etc/elasticsearch/elasticsearch.conf'
  run_dir = '/var/run/elasticsearch'
when 'redhat','centos'
  package_name = 'elasticsearch'
  service_name = 'elasticsearch'
  config_file = '/etc/elasticsearch.conf'
  run_dir = '/run/elasticsearch'
else
  package_name = 'elasticsearch'
  service_name = 'elasticsearch'
  config_file = '/etc/elasticsearch.conf'
  run_dir = '/run/elasticsearch'
end

describe package(package_name) do
  it { should be_installed }
end

describe file(config_file) do
  it { should exist }
  it { should be_file }
  it { should be_mode 640 }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end

describe service(service_name) do
  it { should be_running }
  it { should be_enabled }
end

describe port(9200) do
  it { should be_listening.on('0.0.0.0').with('tcp') }
  it { should_not be_listening.with('udp') }
end
