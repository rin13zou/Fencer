class Post < ApplicationRecord

  has_one_attached :posts_image

  belongs_to :user

  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  
   def favorited_by?(user)
     favorites.exists?(user_id: user_id)
   end

end
