class CreateNegotiateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :negotiate_items do |t|
      t.references :negotiate, index: true, foreign_key: true
      t.references :item, index: true, foreign_key: true
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
