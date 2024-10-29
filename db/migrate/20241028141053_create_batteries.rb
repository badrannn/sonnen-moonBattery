class CreateBatteries < ActiveRecord::Migration[7.0]
  def change
    create_table :batteries do |t|
      t.string :mac_address, null: false
      t.string :serial_number, null: false
      t.timestamp :last_ping_at, default: -> { "CURRENT_TIMESTAMP" }
      t.timestamps
    end

    add_index :batteries, :mac_address, unique: true
    add_index :batteries, :serial_number, unique: true
  end
end
