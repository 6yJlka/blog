class AddImageToBlogPosts < ActiveRecord::Migration[7.1]
  def change
    add_column :blog_posts, :image, :binary
  end
end
