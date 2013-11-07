class CreateTextPosts < ActiveRecord::Migration
  def change
    create_table :text_posts do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
