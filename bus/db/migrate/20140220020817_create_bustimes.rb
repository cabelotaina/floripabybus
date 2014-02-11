class CreateBustimes < ActiveRecord::Migration
  def change
    create_table :bustimes do |t|
      t.time :time
      t.string :label
      t.belongs_to :busdayofweek

      t.timestamps
    end
  end
end
