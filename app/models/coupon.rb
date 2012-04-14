class Coupon < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :value, presence: true, numericality: true

  class << self
    def check_for_request(requested_name)
      search = where(name: requested_name).first
      if search.present?
        {value: search.value, message: 'Valid Coupon'}
      else
        {value: 0, message: 'Invalid Coupon'}
      end
    end
  end
end
