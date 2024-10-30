Rails.application.routes.draw do
  resources :batteries, param: :serial_number, only: [:create] do
    patch "ping", on: :member
    resource :configurations, controller: "battery_configurations", only: [:show] do
      patch :update, on: :member
    end
  end
end
