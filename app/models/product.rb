class Product < ApplicationRecord
    has_many :transactions
    validates_uniqueness_of :name, :message => '"%{value}" has already been taken'
    validates_presence_of :name, :quantity

end
