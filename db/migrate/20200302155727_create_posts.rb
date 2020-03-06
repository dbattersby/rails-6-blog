class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :summary
      t.text :body
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
