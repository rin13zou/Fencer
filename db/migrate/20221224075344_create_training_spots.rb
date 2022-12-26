class CreateTrainingSpots < ActiveRecord::Migration[6.1]
  def change
    create_table :training_spots do |t|

      t.string :address,     null: false
      # 都道府県のカラム名
      t.string :prefectures, null: false
      # フェンシングにクラブ団体名
      t.string :club_name,   null: false
      t.float :latitude,     null: false
      t.float :longitude,    null: false



      t.timestamps
    end
  end
end
