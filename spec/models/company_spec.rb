require 'rails_helper'

RSpec.describe Company, type: :model do
  let(:valid_company) { Company.new(name: "jeffco") }
  let(:invalid_company) { Company.new(name: nil) }

  it 'should have a valid_name' do
    expect(valid_company).to be_valid
  end

  it 'should have a valid_name' do
    expect(invalid_company).not_to be_valid
  end

  it 'should have phone numbers' do
    expect(valid_company.phone_numbers).to eq([])
  end
end
