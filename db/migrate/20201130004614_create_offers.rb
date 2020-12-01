class CreateOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :offers do |t|
      t.string :advertiser_name, null: false
      t.string :url, null: false
      t.text :description, null: false
      t.date :start_at, null: false
      t.date :end_at
      t.string :status, null: false
      t.boolean :premium

      t.timestamps
    end

    add_index :offers, :advertiser_name, unique: true
  end
end