#
# Cookbook:: haproxy
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

package 'haproxy' do
  action :install
end

allwebservers = search('node', "chef_environment:#{node.chef_environment} AND recipe:apache")

template '/etc/haproxy/haproxy.cfg' do
  action :create
  source 'haproxy.cfg.erb'
  mode '0644'
  owner 'root'
  group 'root'
  variables(
    :webservers => allwebservers
  )
  notifies :restart, 'service[haproxy]'
end

service 'haproxy' do
  action [:start, :enable]
end
