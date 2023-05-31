class TransactionsController < ApplicationController
    def index
		@transaction = Transaction.new
        @transactions = Transaction.all
        @product = Product.new
	end

    def new
        @transaction = Transaction.new
    end

	def create
		@transaction = Transaction.new(transaction_params)
        if @transaction.save
            redirect_to transactions_path, notice: "Transaction successfully made"
        else
            render action: 'new'
        end
	end

    def show
        @transactions = Transaction.all
	    @transaction = Transaction.find(params[:id])
    end

    def edit
        @transaction = Transaction.find(params[:id])
    end

    def update 
        @transaction = Transaction.find(params[:id])
        if @transaction.update_attributes(transaction_params)
            redirect_to transactions_path(@transaction.id)
        else
            render action: 'edit'
        end
    end

    def destroy 
        @transaction = Transaction.find(params[:id])
        @transaction.destroy
             redirect_to transactions_path, notice: "The Transaction was successfully deleted"
    end 

	private
	def transaction_params
		params[:transaction].permit(:product_id, :quantity, :transaction_type)
	end
end
