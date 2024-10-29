class BatteriesController < ApplicationController
  def create
    begin
      battery = Battery.create!(battery_params)
      render json: { message: "Battery created successfully. Your device serial number is: #{battery.serial_number}" }, status: :created
    end
  rescue StandardError => e
    render json: { errors: e }, status: :unprocessable_entity
  end

  def battery_params
    params.require(:battery).permit(:mac_address)
  end
end
