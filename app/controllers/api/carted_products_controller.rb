class Api::CartedProductsController < ApplicationController
  def create
    #find the product? 
    # product = Product.find_by(id: params[:product_id])
  
    @carted_products = Carted_Product.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: "carted"
    )
    @carted_products.save
    render "show.json.jbuilder"
  end
end
