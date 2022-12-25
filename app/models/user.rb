class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy

  has_many :post_comments,dependent: :destroy
  has_many :favorites, dependent: :destroy


  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy

  has_many :following_user, through: :follower, source: :followed # 自分がフォローしている人
  has_many :follower_user, through: :followed, source: :follower # 自分をフォローしている人

  # has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  # has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy

  # has_many :followings, through: :relationships, source: :followed
  # has_many :followers, through: :reverse_of_relationships, source: :follower

  has_one_attached :profile_image

  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end


  def self.guest
    # find_or_create_by!でゲストユーザーがなければ作成、あれば取り出す記述
    find_or_create_by!(email: 'guest@sample.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.password_confirmation = user.password
      user.name = '剣士太郎'
      user.name_kana = 'ケンシタロウ'
      user.user_name = 'Guest'
    end
  end


  def follow(user_id)
    follower.create(followed_id: user_id)
  end

  def unfollow(user_id)
    follower.find_by(followed_id: user_id).destroy
  end

  def following?(user)
    following_user.include?(user)
  end


  def active_for_authentication?
    super && (is_deleted == false)
  end

  def self.looks(word)
    if word
      @user = User.where("name LIKE?","%#{word}%")
    else
      @user = User.all
    end
  end

  def admin?
    admin
  end

end
