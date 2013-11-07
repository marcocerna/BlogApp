class CreatePhotoPosts < ActiveRecord::Migration
  def change
    create_table :photo_posts do |t|
      t.string :title
      t.string :url

      t.timestamps
    end
  end
end
