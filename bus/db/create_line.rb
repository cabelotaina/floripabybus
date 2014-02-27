class Create_Lines < ActiveRecord::Migration
  def change
	  create_table :lines do |t|
	  t.string :number
	  t.string :line
	  t.string :company
	  t.decimal :price_card
	  t.decimal :price_money
	  t.time :time_to_go
	  t.time :time_to_back
	  t.decimal :distance_to_go
	  t.decimal :distance_to_back
	  t.string :note

	  t.timestamps
	  end
  end
end
