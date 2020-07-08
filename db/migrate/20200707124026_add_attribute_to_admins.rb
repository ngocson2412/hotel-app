class AddAttributeToAdmins < ActiveRecord::Migration[6.0]
  def change
    add_column :admins, :first_name, :string
    add_column :admins, :last_name, :string
    add_column :admins, :user_number, :string
    add_column :admins, :phone, :integer, :limit => 11
    add_column :admins, :city, :string
    add_column :admins, :addr_1, :string
    add_column :admins, :addr_2, :text
    add_column :admins, :desc, :text
    add_column :admins, :del_flag, :boolean, default: false
    add_column :admins, :deleted_at, :timestamps
  end
end
