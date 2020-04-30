require "rails_helper"

RSpec.describe ConvertController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/convert").to route_to("convert#index")
    end
  end
end
