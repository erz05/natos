class CreateEstimates < ActiveRecord::Migration
  def change
    create_table :estimates do |t|
      t.decimal :amount
      t.references :job, index: true

      t.timestamps
    end
  end
end
