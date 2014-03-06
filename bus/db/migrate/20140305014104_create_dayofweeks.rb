class CreateDayofweeks < ActiveRecord::Migration
  def change
    create_table :dayofweeks do |t|
      t.string :day
      t.string :path
      t.string :direction
      t.belongs_to :line
      t.timestamps
    end
  end
end
