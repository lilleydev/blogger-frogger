class Category < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :category, :string
  end
end
