class RenameUsernameToName < ActiveRecord::Migration[6.0]
  def change
    rename_column :admins, :username, :name
  end
end
