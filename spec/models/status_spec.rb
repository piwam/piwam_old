require 'rails_helper'

describe Status do
  it 'has a valid factory' do
    expect(FactoryBot.create(:status)).to be_valid
  end

  it 'is invalid without a label' do
    expect(FactoryBot.build(:status, label: nil)).not_to be_valid
  end

  it 'does not allow duplicate label' do
    status = FactoryBot.create(:status)
    expect(FactoryBot.build(:status, label: status.label)).not_to be_valid
  end

  it 'returns the label of the status as a string' do
    status = FactoryBot.create(:status, label: 'President')
    expect(status.to_s).to eq('President')
  end
end
