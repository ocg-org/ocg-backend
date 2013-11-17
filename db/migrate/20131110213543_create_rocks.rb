class CreateRocks < ActiveRecord::Migration
  def change
    create_table :rocks do |t|
      t.string :name
      t.integer :region_id
      t.integer :height

      t.timestamps
    end
  end
end
