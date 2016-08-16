
lock '3.5.0'

set :application, 'roberttdaniels'
set :repo_url, 'git@github.com:rdaniels/roberttdaniels.git'

set :rvm1_ruby_version, "ruby-2.3.1"
set :use_sudo, true
set :user, 'deploy'
set :deploy_to, "/home/deploy/roberttdaniels"
set :ssh_options, { :forward_agent => true }

set :linked_dirs, (fetch(:linked_dirs) || []) + %w(log)
set :linked_files, %w{ config/puma.rb }

namespace :deploy do
  before :deploy, :check_for_debugger
  before :deploy, :check_revision
  after :publishing, :restart
end
