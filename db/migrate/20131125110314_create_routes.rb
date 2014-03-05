class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.string :name
      t.integer :difficulty
      t.text :description
      t.integer :rock_id

      t.timestamps
    end
  end
end
