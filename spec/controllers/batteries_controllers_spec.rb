require "rails_helper"

RSpec.describe BatteriesController, type: :request do
  let(:valid_attributes) { { mac_address: Faker::Internet.mac_address } }
  let(:invalid_attributes) { { mac_address: "invalid_address" } }

  describe "POST /batteries" do
    context "with valid parameters" do
      it "creates a new Battery" do
        expect {
          post "/batteries", params: { battery: valid_attributes }
        }.to change(Battery, :count).by(1)
        expect(response).to have_http_status(:created)
      end
      it "creates a new BatteryConfiguration" do
        expect {
          post "/batteries", params: { battery: valid_attributes }
        }.to change(BatteryConfiguration, :count).by(1)
      end
    end
    context "with invalid parameters" do
      it "does not create a new Battery" do
        expect {
          post "/batteries", params: { battery: invalid_attributes }
        }.to change(Battery, :count).by(0)
        expect(response).to have_http_status(:unprocessable_entity)
      end
      it "does not create a new BatteryConfiguration" do
        expect {
          post "/batteries", params: { battery: invalid_attributes }
        }.to change(BatteryConfiguration, :count).by(0)
      end
    end
  end
  describe "PATCH /batteries/:serial_number/ping" do
    let(:battery) { FactoryBot.create(:battery) }
    context "with valid serial number" do
      it "updates the last_ping_at attribute" do
        patch "/batteries/#{battery.serial_number}/ping"
        battery.reload
        expect(battery.last_ping_at).to be_within(1.second).of(Time.now)
        expect(response).to have_http_status(:ok)
      end
    end
    context "with invalid serial number" do
      it "returns an error message" do
        patch "/batteries/invalid_serial_number/ping"
        expect(response).to have_http_status(400)
      end
    end
  end
end
