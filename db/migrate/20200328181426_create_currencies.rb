class CreateCurrencies < ActiveRecord::Migration[5.2]
  def change
    create_table :currencies do |t|
      t.string      :title, null: false
      t.float       :previous_rate, default: 0
      t.float       :current_rate, null: false, default: 0
      t.float       :tomorrow_rate, null: false, default: 0
      t.float       :force_rate, default: 0
      t.datetime    :force_end_time, default: Time.now.beginning_of_year

      t.timestamps
    end
  end
end
