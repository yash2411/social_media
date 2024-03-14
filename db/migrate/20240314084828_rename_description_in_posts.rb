class RenameDescriptionInPosts < ActiveRecord::Migration[7.0]
  def change
    rename_column :posts, :description, :caption
  end
end
