namespace :deploy do
  %w(start stop restart).each do |command|
    desc "#{command} puma"
    task command do
      on roles(:app), in: :sequence, wait: 5 do
        execute "/etc/init.d/puma #{command} puma_#{fetch(:application)}.conf"
      end
    end
  end

  task :puma_direct do
    on roles(:app), in: :sequence, wait: 5 do
      execute :run, "`bundle exec which puma` -C config/puma.rb"
    end
  end

  task :restart_all do
    on roles(:app), in: :sequence, wait: 5 do
      execute "/etc/init.d/puma restart"
    end
  end

  after :publishing, :restart
end
