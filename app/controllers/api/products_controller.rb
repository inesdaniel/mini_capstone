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
    @product1.name = "notebook"
    @product1.price = 5
    @product1.image_url = "notebook.com"
    @product1.description = "Sheets of paper to write on."
    @product1.save
    render "show.json.jbuilder"
  end

end
