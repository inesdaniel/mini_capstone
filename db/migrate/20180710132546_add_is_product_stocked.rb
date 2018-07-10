class AddIsProductStocked < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :stocked, :string
  end
end
