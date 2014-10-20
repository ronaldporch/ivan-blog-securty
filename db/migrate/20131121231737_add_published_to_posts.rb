class AddPublishedToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :published, :boolean, default: false

    50.times { Post.all.sample.update_attributes(published: true) }
  end
end
