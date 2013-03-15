class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |post|
      post.string :title
      post.text :body
      post.timestamps
    end
  end
end
