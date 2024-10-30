require "rails_helper"

RSpec.describe BatteriesController, type: :request do
  let(:battery) { FactoryBot.create(:battery) }
  let(:battery_configurations) { BatteryConfiguration.find_by(battery_serial_number: battery.serial_number) }
  let(:valid_attributes) { { status: "idle" } }

  describe "PATCH /batteries/:serial_number/configurations" do
    context "with valid serial number" do
      it "updates the configuration of the battery" do
        patch "/batteries/#{battery_configurations.battery_serial_number}/configurations",
              params: { battery_configurations: valid_attributes }
        expect(response).to have_http_status(:ok)
        battery_configurations.reload
        expect(battery_configurations.status).to eq("idle")
      end
      it "updates the performance_mode" do
        patch "/batteries/#{battery_configurations.battery_serial_number}/configurations",
              params: { battery_configurations: {
                performance_mode: "high",
              } }
        battery_configurations.reload
        expect(battery_configurations.performance_mode).to eq("high")
      end
    end
    context "with invalid serial number" do
      it "returns an error message" do
        patch "/batteries/invalid_serial_number/configurations",
              params: { battery_configurations: valid_attributes }
        expect(response).to have_http_status(400)
      end
    end
    context "with invalid attributes" do
      it "returns an error message" do
        patch "/batteries/#{battery_configurations.battery_serial_number}/configurations",
              params: { battery_configurations: { status: "invalid" } }
        expect(response).to have_http_status(400)
      end
    end
  end
end
