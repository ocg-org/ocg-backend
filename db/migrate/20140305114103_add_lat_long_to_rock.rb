class AddLatLongToRock < ActiveRecord::Migration
  def change
    add_column :rocks, :latitude, :float
    add_column :rocks, :longtitude, :float
  end
end
