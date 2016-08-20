class CreateNegotiates < ActiveRecord::Migration[5.0]
  def change
    create_table :negotiates do |t|
      t.references :manager, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.datetime :created_date
      t.float :total_price

      t.timestamps null: false
    end
  end
end
