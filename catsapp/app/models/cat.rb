require 'date'

class Cat < ApplicationRecord
  validates :birth_date, presence: true
  validates :color, presence: true
  validates :name, presence:true
  validates :description, presence: true
  validates :sex, presence: true, inclusion: {in: ['F', 'M']}

  def age
    now = Date.today
    days = now - self[:birth_date]
    years = days / 365 
    years.to_i
  end
end
