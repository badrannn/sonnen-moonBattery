class BatteryConfigurationsController < ApplicationController
  def update
    begin
      configuration = Battery.find_by!(serial_number: params[:battery_serial_number]).battery_configuration
      configuration.update!(configuration_params)
      render json: { message: "Configuration updated successfully" }, status: :ok
    end
  rescue StandardError => e
    render json: { errors: e }, status: 400
  end

  def configuration_params
    params.require(:battery_configurations).permit(:status, :performance_mode, :alerts_enabled)
  end
end
