require 'rails_helper'

RSpec.describe CbrRateUpdaterService do
  it 'calls .call' do
    expect(CbrRateUpdaterService).to receive(:call)

    CbrRateUpdaterService.call
  end
end
