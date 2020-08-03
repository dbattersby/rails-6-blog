class AddAccountToPosts < ActiveRecord::Migration[6.0]
  def change
    add_reference :posts, :account
  end
end
