class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.belongs_to :reference
      t.belongs_to :route
      t.timestamps
    end
  end
end
