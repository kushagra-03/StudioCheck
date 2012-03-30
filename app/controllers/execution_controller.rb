class ExecutionController < ApplicationController
  def index
    @workers = Resque.workers
    @schedule = Resque.schedule
    @queues = Resque.queues
  end
end
