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
end
