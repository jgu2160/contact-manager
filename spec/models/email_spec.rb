require 'rails_helper'

RSpec.describe Email, type: :model do
  let(:valid_email) { Email.new(address: 'jgu@jgu.com', person_id: 1) }

  it 'has a valid address' do
    expect(valid_email).to be_valid
  end

  it 'is invalid without an valid address' do
    valid_email.address = nil
    expect(valid_email).not_to be_valid
  end

  it 'is invalid without a person_id' do
    valid_email.person_id = nil
    expect(valid_email).not_to be_valid
  end
end
