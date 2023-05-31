class FixTransactionColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :transactions, :trasaction_type, :transaction_type
  end
end
