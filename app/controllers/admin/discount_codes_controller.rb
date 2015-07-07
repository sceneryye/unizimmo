class Admin::DiscountCodesController < Admin::BaseController
  before_filter :require_permission!

  def show

  end
  def index
    @codes = Ecstore::DiscountCode.paginate(:page => params[:page], :per_page => 20).order("status DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @logs }
    end
  end

  def pages

  end


end
