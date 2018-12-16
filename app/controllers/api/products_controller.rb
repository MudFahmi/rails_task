
module Api
  

  class ProductsController < ApplicationController


  	def index
  		products = Product.all
	    render json: {status: 'SUCCESS', message:'Loaded products', data:products},status: :ok
  	end

    def show
    	 product = Product.find(params[:id])
         render json: {status: 'SUCCESS', message:'Loaded product', data:product},status: :ok
    	
    end

    def search
    	
    	term = params[:term]

    	products = Product.where('name LIKE ?', "%#{term}%")

    	if products.count != 0 

    	    render json: {status: 'POSITIVE', message:'Loaded products', data:products},status: :ok
        else
        	render json: {status: 'NEGATIVE', message:'Empty result'},status: :ok
        end	
    end

    def create
        product = Product.new(product_params)

        if product.save
          render json: {status: 'SUCCESS', message:'Saved product', data:product},status: :ok
        else
          render json: {status: 'ERROR', message:'product not saved', data:product.errors},status: :unprocessable_entity
        end
    end

      def destroy
        product = Product.find(params[:id])
        product.destroy
        render json: {status: 'SUCCESS', message:'Deleted product', data:product},status: :ok
      end

      def update
        product = Product.find(params[:id])
        if product.update_attributes(product_params)
          render json: {status: 'SUCCESS', message:'Updated product', data:product},status: :ok
        else
          render json: {status: 'ERROR', message:'product not updated', data:product.errors},status: :unprocessable_entity
        end
      end

      private

      def product_params
        params.permit(:name)
end

  end	

end

