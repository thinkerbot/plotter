class RelayJob
  include Sidekiq::Worker
  sidekiq_options :retry => false

  def perform(filename)
    logger.info "relay #{filename.inspect}"

    io = File.open(filename, 'r')
    while line = io.gets
      WebsocketRails[:broadcast].trigger(:notice, line)
    end
  end
end
