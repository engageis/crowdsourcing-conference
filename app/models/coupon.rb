class Coupon < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :value, presence: true, numericality: true

  class << self
    def check_for_request(requested_name)
      search = where(name: requested_name, enabled: true).first
      if search.present?
        {value: search.value, message: 'Valid Coupon', valid: true}
      else
        {value: 0, message: 'Invalid Coupon', valid: false}
      end
    end
  end
end
