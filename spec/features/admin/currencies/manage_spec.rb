require 'rails_helper'

feature 'Admin can change exchange rates', %q{
  On admin page
  i'd like to be able
  to change exchange rates
} do

  given!(:currency) { create :currency, title: 'usd' }
  given!(:force_end_time) { Time.now + 2.minutes }
  given!(:force_rate) { 77.7777 }

  scenario 'Admin can force exchange rates', js: true  do
    visit admin_path

    within '.currency-form' do
      fill_in 'Force rate', with: force_rate
      fill_in 'Force end time', with: force_end_time
    end

    click_on 'Force currency'

    expect(page).to have_content force_rate
    expect(page).to have_content force_end_time.to_s(:short)
  end

  describe 'Multiple sessions', js: true do
    scenario 'New rate appears on another user\'s page' do
      Capybara.using_session('user') do
        visit root_path

        expect(page).to have_content currency.current_rate
      end

      Capybara.using_session('admin') do
        visit admin_path

        within '.currency-form' do
          fill_in 'Force rate', with: force_rate
          fill_in 'Force end time', with: force_end_time
        end

        click_on 'Force currency'
      end

      Capybara.using_session('user') do
        visit root_path

        expect(page).to have_content force_rate
      end
    end
  end
end
