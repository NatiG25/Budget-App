class ChangeAmountFromFloatToInteger < ActiveRecord::Migration[7.0]
  def change
    change_column :deals, :amount, :integer
  end
end
