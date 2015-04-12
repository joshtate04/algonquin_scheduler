root = "/var/www/algonquin-scheduler"
working_directory root
pid "#{root}/tmp/pids/unicorn.pid"
stderr_path "#{root}/log/unicorn.error.log"
stdout_path "#{root}/log/unicorn.log"

listen "/tmp/scheduler.sock"
worker_processes 2
timeout 60