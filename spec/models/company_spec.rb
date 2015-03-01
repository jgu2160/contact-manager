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
    valid_company.save
    valid_company.phone_numbers.create(number: '999', contact_type: 'Company')
    expect(valid_company.phone_numbers[0]).to belong_to(:contact)
  end

  it 'should have emails' do
    expect(valid_company.emails).to eq([])
  end
end
