require 'rails_helper'

describe 'statuses/new' do
  before(:each) do
    assign(:status, Status.new)
  end

  it 'renders new status form' do
    render

    assert_select 'form[action=?][method=?]', statuses_path, 'post' do
      assert_select 'input[name=?]', 'status[label]'
    end
  end
end
