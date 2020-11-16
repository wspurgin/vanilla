
require 'rails_helper'
require 'pact/provider/rspec'

Pact.provider_states_for 'Consumer Service' do
  provider_state "things exist" do
    no_op # If there's nothing to do because the state name is more for documentation purposes,
          # you can use no_op to imply this.
  end
end

Pact.service_provider 'Producer Service' do
  honours_pact_with 'Consumer Service' do
    pact_uri Rails.root.join('spec', 'pacts/', 'consumer_service-producer_service.json')
    # pact_uri Rails.root.join('spec', 'pacts/', 'consumer_service-producer_service.pact-support-1.15.1.json')
  end
end
