require 'rails_helper'

#
RSpec.describe "/rates", type: :request do
  describe "GET /index" do
    it "renders a successful response" do
      get rates_url, as: :json
      expect(response).to be_successful
    end
  end
end