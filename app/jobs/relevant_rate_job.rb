class RelevantRateJob < ApplicationJob
  queue_as :default

  def perform
    CbrRateUpdaterService.call
  end
end
