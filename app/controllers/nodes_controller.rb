require 'relay_job'

class NodesController < ApplicationController
  def index
  end

  def data
    render :text => File.read('data/eplus.json')
  end

  def relay
    RelayJob.perform_async(params[:filename] || '/dev/null')
    render :text => "ok"
  end
end
