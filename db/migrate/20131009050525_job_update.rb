class JobUpdate < ActiveRecord::Migration
  def change
  	add_column :jobs, :status, :string
  	remove_column :notes, :total
  end
end
