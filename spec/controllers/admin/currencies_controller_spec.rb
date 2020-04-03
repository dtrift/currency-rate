require 'rails_helper'

RSpec.describe Admin::CurrenciesController, type: :controller do
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

  describe 'PATCH #update' do
    let(:currency) { create :currency, title: 'usd' }
    let(:force_rate) { 77.7777 }
    let(:force_end_time) { Time.now + 2.minutes }

    let(:update_request) { patch :update, params: {
      currency_id: currency,
      force_rate: force_rate,
      force_end_time: force_end_time
      }, format: :js
    }

    context 'with valid attributes' do
      it 'changes currency attributes' do
        update_request
        currency.reload

        expect(currency.current_rate).to eq force_rate
        expect(currency.force_end_time.to_s(:short))
          .to eq force_end_time.to_s(:short)
      end

      it 'redirect to admin/index' do
        update_request

        expect(response).to redirect_to admin_path
      end
    end

    context 'with invalid attributes' do
      it 'does not change currency attributes' do
        expect do
          patch :update, params: {
            currency_id: currency,
            currency: attributes_for(:currency, :invalid)
          }, format: :js

          currency.reload
        end.to_not change(currency, :current_rate)
      end

      it 'redirect to admin/index' do
        patch :update, params: {
          currency_id: currency,
          currency: attributes_for(:currency, :invalid)
        }, format: :js

        expect(response).to redirect_to admin_path
      end
    end
  end
end
