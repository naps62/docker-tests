APP_ROOT = '/home/naps62/subvisual/docker-test/app1'

worker_processes 2
working_directory APP_ROOT

timeout 300

listen "#{APP_ROOT}/tmp/sockets/unicorn.sock", backlog: 64
listen 8080, tcp_nopush: true

pid "#{APP_ROOT}/tmp/pids/unicorn.pid"

stderr_path "#{APP_ROOT}/log/unicorn.stderr.log"
stdout_path "#{APP_ROOT}/log/unicorn.stdout.log"
