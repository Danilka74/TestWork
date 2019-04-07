class AddUrlToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :url, :string
    add_index :posts, :url, unique: true
  end
end
