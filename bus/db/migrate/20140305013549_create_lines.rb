class CreateLines < ActiveRecord::Migration
  def change
    create_table :lines do |t|
      t.string :number
      t.string :name
      t.string :company
      t.decimal :card_price
      t.decimal :money_price
      t.time :time_to_go
      t.time :time_to_back

      t.timestamps
    end
  end
end
