class M2m::ShipperItem < M2m::Base
  default_scope :order => 'shitem.fenumber'
  set_table_name 'shitem'

  belongs_to :shipper, :class_name => 'M2m::Shipper', :foreign_key => :fshipno
  
  alias_attribute :quantity_shipped, :fshipqty
  alias_attribute :quantity_ordered, :forderqty

  attr_accessor :sales_order_release
  def sales_order_release
    @sales_order_release ||= M2m::SalesOrderRelease.for_shipper_items(self).first
  end

  def self.attach_sales_orders(shippers)
    items = shippers.map(&:items).flatten
    releases = M2m::SalesOrderRelease.for_shipper_items(items).all(:include => :sales_order)
    releases.each do |release|
      if item = items.detect { |i| i.for_sales_order_release?(release) }
        item.sales_order_release = release
      end
    end
  end
  
  def sales_order_number
    @sales_order_number ||= self.fsokey[0..5]
  end
  
  def sales_order_release_id
    @sales_order_release_id ||= self.fsokey[6..8]
  end 

  def sales_order_release_number
    @sales_order_release_number ||= self.fsokey[9..11]
  end
    
  def for_sales_order_release?(release)
    (self.sales_order_number == release.sales_order_number) && (self.sales_order_release_id == release.sales_order_release_id) && (self.sales_order_release_number == release.sales_order_release_number)
  end
  
  named_scope :for_sales_order, lambda { |sales_order|
    {
      :joins => 'inner join sorels on sorels.fsono = SUBSTRING(shitem.fsokey,1,6) AND sorels.finumber = SUBSTRING(shitem.fsokey,7,3) AND sorels.frelease = SUBSTRING(shitem.fsokey,10,3)',
      :conditions => [ 'sorels.fsono = ?', sales_order.id ]
    }
  }  
  
end
