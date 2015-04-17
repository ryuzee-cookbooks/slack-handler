#
# Cookbook Name:: slack-handler
# Recipe:: default
#
# Copyright 2014, Ryutaro YOSHIBA
#
# This software is released under the MIT License.
# http://opensource.org/licenses/mit-license.php

directory '/etc/chef/client.d' do
  owner 'root'
  group 'root'
  recursive true
  mode 00755
  action :create
end

template "/etc/chef/client.d/slack.rb" do
  source "slack.rb.erb"
  owner "root"
  group "root"
  mode "00644"
end

directory "/var/chef/handlers" do
  owner "root"
  group "root"
  recursive true
  mode 00755
  action :create
end

template "#{node[:chef_handler][:handler_path]}/chef-handler-slack-event.rb" do
  source "chef-handler-slack-event.rb.erb"
  mode 0644
end

chef_handler "Chef::Handler::SlackEvent" do
  source "#{node[:chef_handler][:handler_path]}/chef-handler-slack-event.rb"
  arguments [
    :slack_webhook_url => node["slack-handler"]["slack_webhook_url"],
    :username => node["slack-handler"]["username"],
    :channel => node["slack-handler"]["channel"],
    :icon_emoji => node["slack-handler"]["icon_emoji"]
  ]
  action :nothing
end.run_action(:enable)

# vim: filetype=ruby.chef
