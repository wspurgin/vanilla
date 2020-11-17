# frozen_string_literal: true

require_relative "pact_helper"
require 'rails_helper'

require 'httparty'

class ThingServiceClient
  include HTTParty
  base_uri 'http://thing-service.com'

  def get_things(thing_ids)
    JSON.parse(self.class.get('/things', { query: { ids: thing_ids } }).body)
  end
end

RSpec.describe ThingServiceClient, pact: true do
  before do
    ThingServiceClient.base_uri 'localhost:1234'
  end

  subject { ThingServiceClient.new }

  describe "#get_things" do
    let(:request_path) { "/things" }
    let(:result) { subject.get_things(thing_ids) }
    let(:response_code) { 200 }
    let(:thing_ids) { [12345, 67890] }
    let(:query_params) { { ids: thing_ids }.to_query }

    before do
      producer_service.
        given('things exist').
        upon_receiving("a request to get data for multiple Things").
        with(
          method: :get,
          path: request_path,
          query: query_params,
        ).
        will_respond_with(
          status: response_code,
          body: response_body
        )
    end

    context "Things exist" do
      let(:response_body) do
        {
          "things": [
            {
              "id": 12345,
              "name": Pact.like("Thing 1"),
            },
            {
              "id": 67890,
              "name": Pact.like("Thing 2"),
            }
          ]
        }
      end

      it "responds with things" do
        expect(result).to be_a(Hash)
      end
    end
  end
end
