class Api::ProductsController < ApplicationController
  def index
    # p current_user 
    # user_input = params[:api_search]
    # if user_input
    #   @products = Product.where('LOWER(name) LIKE ?', "%#{user_input.downcase}%").order(:price) 
    # else 
    #   @products = Product.all.order(:price) 
    # end
    if params[:category]
      category = Category.find_by(name: params[:category])
      p category
      @products = category.products
    else
      @products = Product.all 
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
        description: params[:input_description],
        stocked: params[:input_stocked],
        supplier_id: params[:input_supplier_id]
      )
    if @product.save
      render "show.json.jbuilder"
    else
      render json: {errors: @product.errors.full_messages}, status: :unprocessible_entity
    end
  end

  def update
    product_id = params[:id]
    @product = Product.find_by(id:product_id)
    @product.name = params[:input_name] || @product.name
    @product.price = params[:input_price] || @product.price
    @product.description = params[:input_description] || @product.description
    @product.stocked = params[:input_stocked] || @product.stocked

    if @product.save
      render "show.json.jbuilder"
    else
      render json: {errors: @product.errors.full_messages}, status: :unprocessible_entity
    end

  end

  def destroy
    product_id = params[:id]
    @product = Product.find_by(id:product_id)
    @product.destroy
    render json: {message: "You deleted an item!"}
  end

end
