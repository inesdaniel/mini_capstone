class Api::ProductsController < ApplicationController
  def index
    @products = Product.all 
    render "index.json.jbuilder"
  end 

  def show
    product_id = params[:id]
    @product1 = Product.find_by(id:product_id)
    render "show.json.jbuilder"
  end

  def create
    @product1 = Product.new(
        name: params[:input_name],
        price: params[:input_price],
        image_url: params[:input_image_url],
        description: params[:input_description]
      )
    @product1.save
    render "show.json.jbuilder"
  end

  def update
    product_id = params[:id]
    @product1 = Product.find_by(id:product_id)
    @product1.name = params[:input_name] || @product1.name
    @product1.price = params[:input_price] || @product1.price
    @product1.image_url = params[:input_image_url] || @product1.image_url
    @product1.description = params[:input_description] || @product1.description
    @product1.save
    render "show.json.jbuilder"
  end

  def destroy
    product_id = params[:id]
    @product1 = Product.find_by(id:product_id)
    @product1.destroy
    render json: {message: "You deleted an item!"}
  end

end
