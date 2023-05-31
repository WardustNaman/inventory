class ProductsController < ApplicationController
    def index
        @product = Product.new
        @products = Product.all
    end

    def new
        @products = Product.all
    end

    def show
        @product = Product.find(params[:id])
    end

    def edit
        @product = Product.find(params[:id])
    end

    def update 
        @product = Product.find(params[:id])
        if @product.update_attributes(product_params)
            redirect_to products_path(@product.id)
        else
            render action: 'edit'
        end
    end

    def create
        @product = Product.new(product_params)
        @product.save
        respond_to do |format|
            if @product.save
                format.html { redirect_to root_path, notice: 'Product was successfully created.' }
                format.js
                format.json { render json: @product, status: :created, location: @product }
            else
                format.html { render action: "new" }
                format.json { render json: @product.errors, status: :unprocessable_entity }
            end
        end
    end

    def destroy 
        @product = Product.find(params[:id])
        @product.destroy
            redirect_to products_path, notice: "The product was successfully removed"
    end 

    private

    def product_params
        params.require(:product).permit(:name, :description, :quantity)
    end 
end
