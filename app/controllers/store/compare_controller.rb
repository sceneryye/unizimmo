#encoding:utf-8
class Store::CompareController < ApplicationController
  # before_filter :find_user
  layout "standard"


  def index
    if signed_in?
      member_id = @user.member_id
      member_ident = Digest::MD5.hexdigest(@user.member_id.to_s)
       @compare = Ecstore::GoodsCompare.where(:member_id=>member_id)
    else
      redirect_to "/login"
      # member_id = -1
      # member_ident = @m_id
    end
  
  end

   
  def add
    
    goods_id = params[:goods_id]
    
    if signed_in?
      member_id = @user.member_id
      member_ident = Digest::MD5.hexdigest(@user.member_id.to_s)
    else
      redirect_to "/login"
      # member_id = -1
      # member_ident = @m_id
    end

    @compare = Ecstore::GoodsCompare.where(:goods_id=>goods_id,:member_id=>member_id).first_or_initialize do |compare|
       #             :member_ident=>member_ident).first_or_initialize do |cart|
      compare.member_id = member_id
      compare.goods_id=goods_id
    end

    if @compare.new_record?
      @compare.save
    end   
    redirect_to "/compare"
    # if @user
    #   if @user.mobile.nil?
    #     redirect_to '/register?from=weixin&return_url=/cart'
    #   else
    #     redirect_to "/cart"
    #   end
    # else
    #   redirect_to  "/auto_login?id=1&platform=mobile&return_url=/cart"
    # end
  #rescue
    #render :text=>"add failed"
  end

  def destroy
     goods_id = params[:goods_id]
    
    if signed_in?
      member_id = @user.member_id
      member_ident = Digest::MD5.hexdigest(@user.member_id.to_s)
    else
      redirect_to "/login"
      # member_id = -1
      # member_ident = @m_id
    end
    #_type, goods_id, product_id = params[:id].split('_')
    Ecstore::GoodsCompare.where(:goods_id=>goods_id,:member_id=>member_id).delete_all
    #@line_items.where(:obj_ident=>params[:id]).delete_all
   # @user.custom_specs.where(:product_id=>product_id).delete_all if signed_in?

   redirect_to "/compare"

   # render "destroy"
  end


end
