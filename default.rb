#
# Cookbook Name:: phpapp
# Recipe:: default
#
# Copyright 2015, 1020198 PaaS
#
# All rights reserved - Do Not Redistribute
#
include_recipe "apache2"
include_recipe "mysql::client"
include_recipe "mysql::server"

apache_site "default" do
  enable true
end
