class Api::CartedProductsController < ApplicationController
  def index
    # @carted_product= CartedProduct.all
    if current_user 
      @carted_product = CartedProduct.where(user_id: current_user) 
    else 
      @carted_product= CartedProduct.all
    end
    render "index.json.jbuilder"
  end


  def create
    #find the product? 
    # product = Product.find_by(id: params[:product_id])
  
    @carted_product = CartedProduct.new(
      user_id: current_user.id,
      product_id: params[:input_product_id],
      quantity: params[:input_quantity],
      status: "carted"
    )
    @carted_product.save
    render "show.json.jbuilder"
  end

end
