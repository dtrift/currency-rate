require 'rails_helper'

RSpec.describe RelevantRateJob, type: :job do
  it 'calls CbrRateUpdaterService#call' do
    expect(CbrRateUpdaterService).to receive(:call)

    RelevantRateJob.perform_now
  end
end
