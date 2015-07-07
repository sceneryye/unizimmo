#encoding:utf-8
class HomeController < ApplicationController
  before_filter :find_user
	# layout 'magazine'
	layout 'standard'

	def index

		@title = "滋贸万国-首页"
		#@home = Ecstore::Home.where(:supplier_id=>nil).last
		@goods = Ecstore::Good.where(:marketable=>'true').order("goods_id desc").limit(8)
		if signed_in?
		   redirect_to params[:return_url] if params[:return_url].present?
		end
	end

	def blank
		@return_url = params[:return_url]
		render :layout=>nil
	end

	def topmenu
		render :layout=>nil
	end
	
	def subscription_success
		@title = "佐康茶"
	end

end
