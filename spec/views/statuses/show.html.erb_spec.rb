require 'rails_helper'

describe 'statuses/show' do
  before(:each) do
    @status = assign(:status, FactoryBot.create(:status, label: 'President'))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/President/)
  end
end
