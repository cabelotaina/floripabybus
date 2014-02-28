class CreateHours < ActiveRecord::Migration
  def change
    create_table :hours do |t|
      t.time :value

      t.timestamps
    end
  end
end
