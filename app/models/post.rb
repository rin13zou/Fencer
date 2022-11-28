class Post < ApplicationRecord

  has_one_attached :posts_image


  def get_posts_image(width, height)
    posts_image.variant(resize_to_limit: [width, height]).processed
  end

  belongs_to :user

  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy


   def favorited_by?(user)
     favorites.exists?(user_id: user_id)
   end

  def self.looks(word)
    if word
      @post = Post.where("body LIKE?","%#{word}%")
    else
      @post = Post.all
    end
  end

  with_options presence: true, on: :publicize do
    validates :body
  end

  validates :body, length: { maximum: 256 }, on: :publicize

end
