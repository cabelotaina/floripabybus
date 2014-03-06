class CreateHours < ActiveRecord::Migration
  def change
    create_table :hours do |t|
      t.time :time
      t.belongs_to :dayofweek
      t.timestamps
    end
  end
end
