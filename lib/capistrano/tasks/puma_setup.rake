desc 'Setup the puma directories and pid file'
task :setup_puma do
  on roles(:app), in: :sequence, wait: 5 do
    execute "mkdir #{shared_path}/sockets"
    execute "mkdir #{shared_path}/pids"
    execute "touch #{shared_path}/pids/puma.pid"
  end
end
