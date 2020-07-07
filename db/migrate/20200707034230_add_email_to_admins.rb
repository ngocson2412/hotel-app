class AddEmailToAdmins < ActiveRecord::Migration[6.0]
  def change
    add_column :admins, :is_admin, :boolean, default: false
  end
end
