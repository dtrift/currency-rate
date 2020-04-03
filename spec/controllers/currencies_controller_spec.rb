require 'rails_helper'

RSpec.describe CurrenciesController, type: :controller do
  describe 'GET #index' do
    let(:currencies) { create_list :currencies_list, 3 }

    before { get :index }

    it 'populates an array of all currencies' do
      expect(assigns(:currencies)).to match_array(currencies)
    end

    it 'renders index view' do
      expect(response).to render_template :index
    end
  end
end
