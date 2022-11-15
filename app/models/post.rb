class Post < ApplicationRecord

  has_one_attached :posts_image

  belongs_to :user

  has_many :post_comments, dependent: :destroy

end
