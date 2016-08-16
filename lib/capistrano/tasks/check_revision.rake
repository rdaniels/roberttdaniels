desc "Makes sure local git is in sync with remote."
task :check_revision do
  unless `git rev-parse HEAD` == `git rev-parse origin/#{ENV['BRANCH'] || 'master'}`
    fail "\n\n WARNING: HEAD is not the same as origin/master \n
    Run `git push` to sync changes. \n\n"
  end
end

