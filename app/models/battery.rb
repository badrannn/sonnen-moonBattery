require "securerandom"

class Battery < ApplicationRecord
  before_create :assign_serial_number, :generate_configuration

  # validations
  validates :mac_address, presence: true, uniqueness: true,
                          format: { with: /\A([0-9A-F]{2}[-:]){5}([0-9A-F]{2})\z/,
                                    message: "must be a valid MAC address" }

  private

  def assign_serial_number
    # making sure that the token is unique
    self.serial_number = SecureRandom.uuid
  end

  private

  def generate_configuration
  end
end
