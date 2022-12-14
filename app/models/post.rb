class Post < ApplicationRecord
  
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :member
  
  has_one_attached :image
  
  validates :shop, presence: true
  validates :image, presence: true
  
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end
  
  def favorited_by?(member)
    favorites.exists?(member_id: member.id)
  end

end
