class DoNotAllowNilForAboutPageAdminUsers < ActiveRecord::Migration[7.0]
  def change
    change_column_null :admin_users, :about_page, false
  end
end
