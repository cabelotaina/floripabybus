class CreateReferences < ActiveRecord::Migration
  def change
    create_table :references do |t|
      t.belongs_to :line
      t.timestamps
    end
  end
end
