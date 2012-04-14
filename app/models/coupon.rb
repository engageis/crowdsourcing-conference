class Coupon < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :value, presence: true, numericality: true
end
