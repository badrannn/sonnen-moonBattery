class BatteryConfiguration < ApplicationRecord
  belongs_to :battery, foreign_key: :battery_serial_number, primary_key: :serial_number
  enum status: { active: 0, charging: 1, discharging: 2, idle: 3 }
  enum performance_mode: { balanced: 0, eco: 1, high: 2}
end
