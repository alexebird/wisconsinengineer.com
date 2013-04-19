desc "Restart Passenger locally."
task :restart do
  sh "touch tmp/restart.txt"
end
