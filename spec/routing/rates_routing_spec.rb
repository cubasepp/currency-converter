require "rails_helper"

RSpec.describe RatesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/rates").to route_to("rates#index")
    end
  end
end
