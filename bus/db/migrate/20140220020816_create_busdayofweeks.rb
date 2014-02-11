class CreateBusdayofweeks < ActiveRecord::Migration
  def change
    create_table :busdayofweeks do |t|
      t.string :day
      t.string :direction
      t.belongs_to :busline

      t.timestamps
    end
  end
end
