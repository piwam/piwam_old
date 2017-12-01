require 'rails_helper'

describe 'statuses/index' do
  before(:each) do
    assign(:statuses, [
      FactoryBot.create(:status, label: 'President'),
      FactoryBot.create(:status, label: 'Treasurer')
    ])
  end

  it 'renders a list of statuses' do
    render
    assert_select 'tr>td', text: 'President', count: 1
    assert_select 'tr>td', text: 'Treasurer', count: 1
  end
end
