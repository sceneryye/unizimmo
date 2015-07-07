class PagesController < ApplicationController

	layout 'standard'

	def show
		@page = Ecstore::Page.includes(:meta_seo).find(params[:id])
    @title = @page.title

    if params[:id]=='yntyc'
      @goods = Ecstore::Good.where("goods_id>=21 and goods_id<=30").order("price").limit(10)
      sql = "SELECT o.order_id FROM mdk.sdb_b2c_orders o left join mdk.sdb_b2c_order_items i on o.order_id=i.order_id where o.pay_status='1' and i.goods_id>=21 and i.goods_id<=30"
      results = ActiveRecord::Base.connection.execute(sql)

      @people =  results.size
    end
    @recommend_user = session[:recommend_user]

    if @recommend_user==nil &&  params[:wechatuser]
      @recommend_user = params[:wechatuser]
    end

    if @recommend_user
      member_id =-1
      if signed_in?
        member_id = @user.member_id
      end
      now  = Time.now.to_i
      Ecstore::RecommendLog.new do |rl|
        rl.wechat_id = @recommend_user
        #rl.goods_id = @good.goods_id
        rl.member_id = member_id
        rl.terminal_info = request.env['HTTP_USER_AGENT']
        #   rl.remote_ip = request.remote_ip
        rl.access_time = now
      end.save
      session[:recommend_user]=@recommend_user
      session[:recommend_time] =now
    end


     render :layout=> @page.layout.present? ? @page.layout : nil

	end



end
