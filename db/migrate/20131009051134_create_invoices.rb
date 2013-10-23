class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.decimal :total
      t.text :description
      t.references :job, index: true

      t.timestamps
    end
  end
end
