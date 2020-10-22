class CreateLists < ActiveRecord::Migration[6.0]
  def change
    create_table :lists do |t|
      t.string :item
      t.references :todo, null: false, foreign_key: true
      t.integer :priority, null: false, default: 100
      t.datetime :completed_ad
      t.date :dline

      t.timestamps
    end
  end
end
