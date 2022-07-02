class AddAboutPageToAdminUser < ActiveRecord::Migration[7.0]
  def change
    add_column :admin_users, :about_page, :boolean, default: false
  end
end
