class CreateEasyPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :easy_posts do |t|
      t.string :address

      t.timestamps
    end
  end
end
