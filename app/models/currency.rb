class Currency < ApplicationRecord
  default_scope { order(id: :asc) }

  validates :title, :current_rate, :force_rate, :force_end_time, presence: true
  validates :force_rate, numericality: { greater_than_or_equal_to: 0 }

  def remaining_time
    (force_end_time - Time.now).seconds
  end

  def force_time_is_over?
    remaining_time < 0
  end
end
