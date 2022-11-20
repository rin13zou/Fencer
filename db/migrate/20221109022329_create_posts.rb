class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|

      # Postsに必要なカラムを記入 11/9
      t.integer :user_id, null: false
      # ↓のbodyは投稿内容を示す
      t.text :body,       null: false

      t.timestamps
    end
  end
end
