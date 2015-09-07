APP_ROOT = '/var/www/app'

worker_processes 2
working_directory APP_ROOT

timeout 300

listen "#{APP_ROOT}/tmp/sockets/unicorn.sock", backlog: 64
listen 3001, tcp_nopush: true

pid "#{APP_ROOT}/tmp/pids/unicorn.pid"

stderr_path "#{APP_ROOT}/log/unicorn.stderr.log"
stdout_path "#{APP_ROOT}/log/unicorn.stdout.log"

preload_app true

before_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end
end

after_fork do |server, work|
  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and doing nothing. Wait for master to send QUIT'
  end
end
