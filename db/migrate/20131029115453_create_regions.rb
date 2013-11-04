class CreateRegions < ActiveRecord::Migration
  def change
    create_table :regions do |t|
      t.string :name
      t.integer :parent_region_id

      t.timestamps
    end
  end
end
