class Company < ActiveRecord::Base
  has_many :phone_numbers, as: :contact
  has_many :emails, as: :contact
  validates :name, presence: true
end
