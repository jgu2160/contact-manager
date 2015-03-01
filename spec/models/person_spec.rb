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
    person.save
    person.phone_numbers.create(number: '5', contact_type: 'Person')
    expect(person.phone_numbers[0]).to belong_to(:contact)
  end

  it 'has_an_array_of_emails' do
    person.save
    person.emails.create(address: 'jgu@gmail.com')
    expect(person.emails[0]).to belong_to(:person)
  end
end
