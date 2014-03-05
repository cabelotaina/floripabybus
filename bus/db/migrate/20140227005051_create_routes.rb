class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.belongs_to :line
      t.timestamps
    end
  end
end
