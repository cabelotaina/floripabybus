class AddPositionToPlace < ActiveRecord::Migration
  def change
    add_column :places, :position, :integer
  end
end
