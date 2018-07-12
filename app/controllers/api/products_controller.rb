class Api::ProductsController < ApplicationController
  def index
    user_input = params[:api_search]
    if user_input
      @products = Product.where('LOWER(name) LIKE ?', "%#{user_input.downcase}%").order(:price) 
    else 
      @products = Product.all.order(:price) 
    end
    render "index.json.jbuilder"
  end 

  def show
    product_id = params[:id]
    @product = Product.find_by(id:product_id)
    render "show.json.jbuilder"
  end

  def create
    @product = Product.new(
        name: params[:input_name],
        price: params[:input_price],
        image_url: params[:input_image_url],
        description: params[:input_description],
        stocked: params[:input_stocked]
      )
    @product.save
    render "show.json.jbuilder"
  end

  def update
    product_id = params[:id]
    @product = Product.find_by(id:product_id)
    @product.name = params[:input_name] || @product.name
    @product.price = params[:input_price] || @product.price
    @product.image_url = params[:input_image_url] || @product.image_url
    @product.description = params[:input_description] || @product.description
    @product.stocked = params[:input_stocked] || @product.stocked
    @product.save
    render "show.json.jbuilder"
  end

  def destroy
    product_id = params[:id]
    @product = Product.find_by(id:product_id)
    @product.destroy
    render json: {message: "You deleted an item!"}
  end

end
