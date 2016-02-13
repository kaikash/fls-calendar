class Event < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true, length: { maximum: 200 }
  validates :date, presence: true
  validates :reiteration, inclusion: {in: ['empty', 'daily', 'weekly', 'monthly', 'annually']}, allow_nil: true

  paginates_per 40

  scope :hidden, -> { where(private: true) }
  scope :visible, -> { where(private: false) }

  enum reiteration: [:empty, :daily, :weekly, :monthly, :annually]

  def self.calendar(date)
    where_clause = "(date >= :beginning_of_month and date <= :end_of_month) or 
                    (reiteration = 1 and date <= :date) or 
                    (reiteration = 2 and date <= :date) or
                    (
                      (reiteration = 4 or reiteration = 3) and 
                      extract(day from date) >= :beginning_of_month_day and 
                      extract(day from date) <= :end_of_month_day and
                      date <= :date
                    )"
    where(where_clause, 
      {
        date: date,
        beginning_of_month: date.at_beginning_of_month, 
        end_of_month: date.at_end_of_month,
        beginning_of_month_day: date.at_beginning_of_month.day,
        end_of_month_day: date.at_end_of_month.day
      })
  end
end
