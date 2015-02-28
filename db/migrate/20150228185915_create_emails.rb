class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.text :address
      t.references :person, index: true

      t.timestamps null: false
    end
    add_foreign_key :emails, :people
  end
end
