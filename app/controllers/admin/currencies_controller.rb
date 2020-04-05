class Admin::CurrenciesController < ApplicationController
  after_action :return_relevant_rate!, only: %i[update]
  after_action :update_rate, only: %i[update]

  def index
    @currencies ||= Currency.all
  end

  def update
    @currency = Currency.find(params[:currency_id])

    if @currency.save
      @currency.update(
        previous_rate: @currency.current_rate,
        current_rate: params[:force_rate],
        force_end_time: params[:force_end_time]
        )

      redirect_to admin_path
    else
      render :index
    end
  end

  private

  def currency_params
    params.permit(:force_rate, :force_end_time)
  end

  def return_relevant_rate!
    RelevantRateJob.set(wait_until: @currency.force_end_time).perform_later
  end

  def update_rate
    ActionCable.server.broadcast(
      'rate_channel',
        current_rate: @currency.current_rate
      )
  end
end
