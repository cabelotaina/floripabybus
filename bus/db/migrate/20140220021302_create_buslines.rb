class CreateBuslines < ActiveRecord::Migration
  def change
    create_table :buslines do |t|
      t.string :number
      t.string :line
      t.string :company
      t.decimal :card_price
      t.decimal :money_price
      t.time :time_to_go
      t.time :time_to_back
      t.references :busdayofweek, index: true

      t.timestamps
    end
  end
end
