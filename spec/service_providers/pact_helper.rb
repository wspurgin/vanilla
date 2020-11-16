require "pact/consumer/rspec"

Pact.configure do |config|
  config.pactfile_write_mode = :overwrite
end

Pact.service_consumer "Consumer Service" do
  has_pact_with "Producer Service" do
    mock_service :producer_service do
      port 1234
    end
  end
end
