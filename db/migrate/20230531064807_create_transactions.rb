class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.string :trasaction_type
      t.integer :quantity
      t.references :product

      t.timestamps
    end
  end
end
