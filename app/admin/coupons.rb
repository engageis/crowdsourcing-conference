ActiveAdmin.register Coupon do
  menu label: 'Coupons'
  actions :all, except: :destroy
end
