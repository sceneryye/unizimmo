class Ecstore::GoodsReviewLog < Ecstore::Base
	self.table_name = "sdb_b2c_goods_review_log"
  	self.accessible_all_columns
  	
  	belongs_to :good, :foreign_key=>"goods_id"

  	belongs_to :account,:foreign_key=>"member_id"

end