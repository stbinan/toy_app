class Micropost < ActiveRecord::Base
  belongs_to :user
  default_scope -> {order(created_at: :desc)}
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }

  has_attached_file :picture, :styles => {:original => "600x600>"}
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/
end
