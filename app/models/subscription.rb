class Subscription < ActiveRecord::Base
  validates :name, :type, :birthday, :company, :role, :phone, :phone_cell, :sex, :city, :state, presence: true
  validates :email, presence: true, :format => {:with => Devise.email_regexp}
end
