class CreateBatteryConfigurations < ActiveRecord::Migration[7.0]
  def change
    create_table :battery_configurations do |t|
      t.string :battery_serial_number, null: false
      t.integer :status, default: 0, null: false
      t.boolean :alerts_enabled, default: true, null: false
      t.integer :performance_mode, default: 0, null: false
      t.timestamps
    end
    add_index :battery_configurations, :battery_serial_number, unique: true
    add_foreign_key :battery_configurations, :batteries, column: :battery_serial_number, primary_key: :serial_number
  end
end
