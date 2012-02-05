class Items::QuoteItemsController < ApplicationController
  filter_access_to_defaults

  def index
    @item = parent_object
    @quote_items = @item.quote_items.reverse_order.paginate(:page => params[:page], :per_page => 10)
  end

  protected

    def model_class
      M2m::QuoteItem
    end
    
    def parent_object
      @parent_object ||= M2m::Item.find(params[:item_id])
    end
    
end
