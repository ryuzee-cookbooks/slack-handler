#
# Cookbook Name:: slack-handler
# Recipe:: default
#
# Copyright 2014, Ryutaro YOSHIBA
#
# This software is released under the MIT License.
# http://opensource.org/licenses/mit-license.php

chef_gem "chef-handler-slack" do
  action :upgrade
end

require 'chef/handler/slack'

chef_handler "Chef::Handler::SlackReporting" do
  source "chef/handler/slack"
  arguments [
    # The name of your team registered with Slack
    :team => node["slack-handler"]["team"],

    # Your incoming webhook token
    :token => node["slack-handler"]["token"],

    # An existing channel
    :channel => node["slack-handler"]["channel"],

    # Watever.
    :icon_emoj => node["slack-handler"]["icon_emoj"],
  ]
  action :nothing
end.run_action(:enable)

# vim: filetype=ruby.chef
