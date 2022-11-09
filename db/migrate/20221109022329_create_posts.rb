class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      
      # Postsに必要なカラムを記入

      t.timestamps
    end
  end
end
