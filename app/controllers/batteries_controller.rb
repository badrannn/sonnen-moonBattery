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

  def ping
    begin
      battery = Battery.find_by!(serial_number: params[:serial_number])
      battery.update!(last_ping_at: Time.now)
      render json: { message: "Ping received at: #{Time.now}" }, status: :ok
    end
  rescue StandardError => e
    render json: { errors: "Something went wrong. Please check your serial number" }, status: 400
  end
end
