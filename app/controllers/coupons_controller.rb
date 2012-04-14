class CouponsController < ApplicationController
  def check_consistency
    respond_to do |format|
      format.json { render :json => Coupon.check_for_request(params[:coupon_name]).to_json  }
    end
  end
end
