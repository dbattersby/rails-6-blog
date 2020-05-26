class RemoveColumnsFromUsers < ActiveRecord::Migration[6.0]
  def up
    # db migrate
    remove_column :admins, :name
  end
  def down
    # db rollback
    add_column :admins, :name, :string, null: false
  end
end
