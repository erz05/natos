class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.decimal :amount
      t.references :job, index: true

      t.timestamps
    end
  end
end
