class Api::OrdersController < ApplicationController
  def show
    order_id = params[:id]
    @order = Order.find(order_id)
    render "show.json.jbuilder"
  end

  def create
    @order = Order.new(
      product_id: params[:product_id],
      quantity: params[:quantity]
    )
    @order.save
    render "show.json.jbuilder"
  end
end
