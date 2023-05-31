class Transaction < ApplicationRecord
    belongs_to :product
    validates_presence_of :product_id, :transaction_type, :quantity
    after_create :update_quantity

    def update_quantity
        if self.transaction_type == "Incoming Transaction"
            self.product.update_attributes(quantity: self.product.quantity + self.quantity)
        else
            if (self.product.quantity - self.quantity) < 0
                raise "Transaction can't be made as quantity can't be less than zero."
            else
                self.product.update_attributes(quantity: self.product.quantity - self.quantity)
            end
        end
	end

end
