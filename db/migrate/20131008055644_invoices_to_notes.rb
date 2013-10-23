class InvoicesToNotes < ActiveRecord::Migration
  def change
  	rename_table :invoices, :notes
  end
end
