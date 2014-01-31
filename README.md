Start Redis

    brew install redis
    sed -e 's/^daemonize no/daemonize yes/'
    redis-server /usr/local/etc/redis.conf

Start the app

    sidekiq      # -d -P tmp/pids/sidekiq -L log/sidekiq.log
    thin start
