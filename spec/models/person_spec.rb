require 'rails_helper'

RSpec.describe Person, type: :model do
  let(:person) { Person.new(first_name: 'Alice', last_name: 'Smith') }

  it 'is invalid without first name' do
    person.first_name = nil
    expect(person).not_to be_valid
  end

  it 'is invalid without last name' do
    person.last_name = nil
    expect(person).not_to be_valid
  end

  it 'is valid' do
    expect(person).to be_valid
  end

  it 'has_an_array_of_phone_numbers' do
    expect(person.phone_numbers).to eq([])
  end

  it 'has_an_array_of_emails' do
    expect(person.emails).to eq([])
  end
end
