class AddDefaultValueToStatus < ActiveRecord::Migration[5.2]
  def up
    change_column :offers, :status, :string, null: false, default: 'disabled'
  end

  def down
    change_column :offers, :status, :string, null: false
  end
end