require 'rails_helper'

RSpec.describe Currency, type: :model do
  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :current_rate }
    it { should validate_presence_of :force_rate }
    it { should validate_presence_of :force_end_time }
    # it { should validate_numericality_of(:current_rate).is_greater_than_or_equal_to(0) }
  end

  describe 'model methods' do
    let!(:currency) { create :currency, force_end_time: Time.now + 5.minutes }

    context '#remaining_time' do
      it 'greater than 0' do
        expect(currency.remaining_time).to be > 0
      end
    end

    context '#force_time_is_over?' do
      it 'is not over' do
        expect(currency.force_time_is_over?).to_not be true
      end
    end
  end
end
