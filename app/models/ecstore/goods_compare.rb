class Ecstore::GoodsCompare < Ecstore::Base
	self.table_name = "sdb_b2c_goods_compare"
  	self.accessible_all_columns
  	
  	belongs_to :good, :foreign_key=>"goods_id"

  	belongs_to :account,:foreign_key=>"member_id"

  	belongs_to :product, :foreign_key=>"product_id"

end