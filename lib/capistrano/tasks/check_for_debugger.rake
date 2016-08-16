desc 'Check for debugger statements'
task :check_for_debugger do
  run_locally do
    dirs = %w(./app/models ./app/controllers ./app/views ./spec)

    grep = capture(
      dirs.map do |d|
        "grep -nr --exclude=*.jpg --exclude=*.png pry #{d}"
      end.join("; ") + "; true"
    )

    break true if grep.length <= 0
    fail "\n\n Found Pry Statement in: \n #{grep} \n\n"

    grep = capture(
      dirs.map do |d|
        %w{grep -nr --exclude=*.jpg --exclude=*.png "pp " #{d}}
      end.join("; ") + "; true"
    )

    break true if grep.length <= 0
    fail "\n\n Found Pry Statement in: \n #{grep} \n\n"
  end
end

