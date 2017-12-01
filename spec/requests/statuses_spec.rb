require 'rails_helper'

describe 'Statuses' do
  describe 'GET /statuses' do
    it 'works! (now write some real specs)' do
      get statuses_path
      expect(response).to have_http_status(200)
    end
  end
end
