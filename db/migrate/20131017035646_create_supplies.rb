class CreateSupplies < ActiveRecord::Migration
  def change
    create_table :supplies do |t|
      t.string :title
      t.text :description
      t.integer :quantity

      t.timestamps
    end
  end
end
