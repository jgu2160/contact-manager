class ChangeEmailPersonColumnToContact < ActiveRecord::Migration
  def up
    Email.destroy_all
    remove_column :emails, :person_id
    add_column :emails, :contact_id, :integer
    add_column :emails, :contact_type, :text
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
