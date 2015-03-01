require 'rails_helper'

describe 'the person view', type: :feature do
  describe 'the phone number function' do
    let(:person) { Person.create(first_name: 'jeff', last_name: 'gu') }

    before :each do
      person.phone_numbers.create(number: '91112')
      person.phone_numbers.create(number: '33373')
      visit person_path(person)
    end

    it 'shows the phone numbers' do
      person.phone_numbers.each do |phone|
        expect(page).to have_content(phone.number)
      end
    end

    it 'has a link to add phone number' do
      expect(page).to have_link('Add phone number', href: new_phone_number_path(contact_id: person.id, contact_type: 'Person'))
    end

    it 'adds a phone number' do
      page.click_link 'Add phone number'
      page.fill_in('Number', with: '555999')
      page.click_button('Create Phone number')
      expect(current_path).to eq(person_path(person))
      expect(page).to have_content('555999')
    end

    it 'has links to edit phone numbers' do
      person.phone_numbers.each do |phone|
        expect(page).to have_link('edit', href: edit_phone_number_path(phone))
      end
    end

    it 'edits a phone number' do
      phone = person.phone_numbers.first
      old_number = phone.number
      first(:link, 'edit').click
      page.fill_in('Number', with: '999')
      page.click_button('Update Phone number')
      expect(current_path).to eq(person_path(person))
      expect(page).to have_content('999')
      expect(page).not_to have_content(old_number)
    end

    it 'has a link to delete phone numbers' do
      person.phone_numbers.each do |phone|
        expect(page).to have_link('delete', href: phone_number_path(phone))
      end
    end

    it 'deletes a phone number' do
      phone = person.phone_numbers.first
      number = phone.number
      first(:link, 'delete').click
      expect(current_path).to eq(person_path(person))
      expect(page).not_to have_content(number)
    end
  end

  describe 'the email function' do
    let(:jeff) { Person.create(first_name: 'jeff', last_name: 'gu') }

    before :each do
      jeff.emails.create(address: 'jeff@gmail.com')
      jeff.emails.create(address: 'gu@gmail.com')
      visit person_path(jeff)
    end

    it 'should display the emails' do
      expect(page).to have_selector('li', text: 'jeff@gmail.com')
      expect(page).to have_selector('li', text: 'gu@gmail.com')
    end

    it 'should display a new email link' do
      expect(page).to have_link('New email', href: new_email_path(person_id: jeff.id))
    end

    it 'add an email' do
      page.click_link('New email')
      page.fill_in('Address', with: 'jgu@jgu.com')
      page.click_button('Create Email')
      expect(page).to have_selector('li', text: 'jgu@jgu.com')
    end

    it 'should have an edit link' do
      jeff.emails.each do |email|
        expect(page).to have_link('edit', href: edit_email_path(email))
      end
    end

    it 'should edit an email' do
      email = jeff.emails.first
      old_email = email.address
      first(:link, 'edit').click
      page.fill_in('Address', with: '8@8.com')
      page.click_button('Update Email')
      expect(current_path).to eq(person_path(jeff))
      expect(page).to have_content('8@8.com')
      expect(page).not_to have_content(old_email)
    end

    it 'should have a delete link' do
      jeff.emails.each do |email|
        expect(page).to have_link('delete', href: email_path(email))
      end
    end

    it 'should delete the link' do
      email_address = jeff.emails.first.address
      first(:link, 'delete').click
      expect(current_path).to eq(person_path(jeff))
      expect(page).not_to have_content(email_address)
    end
  end
end
