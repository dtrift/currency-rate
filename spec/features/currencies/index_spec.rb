require 'rails_helper'

feature 'User can view exchange rates', %q{
  As an any unauthenticated user
  i'd like to be able
  to view exchange rates
} do

  given!(:currencies) { create_list :currencies_list, 3 }

  scenario 'Any User can view exchange rates' do
    visit root_path

    currencies.each do |currency|
      expect(page).to have_content currency.title
      expect(page).to have_content currency.current_rate
      expect(page).to have_content currency.tomorrow_rate
    end
  end
end
