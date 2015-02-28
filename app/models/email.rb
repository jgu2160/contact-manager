class Email < ActiveRecord::Base
  belongs_to :person
  validates :address, :person_id, presence: true
end
