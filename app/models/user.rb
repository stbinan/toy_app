class User < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  before_save {self.email = email.downcase}
  has_secure_password

  validates :name, presence: true,
                   length: {maximum: 50}
  validates :email, presence: true,
                    length: {maximum: 255},
                    format: {with: VALID_EMAIL_REGEX},
                    uniqueness: {case_sensitive: false}
  validates :password, presence: true,
                       length: {minimum: 6}
  has_attached_file :avatar, :styles => { :medium => "300x300>",
                                          :thumb => "100x100#" },
                             :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates_with AttachmentSizeValidator, :attributes => :avatar, :less_than => 1.megabytes
end
