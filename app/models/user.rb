class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :articles
  has_many :comments

  # Set sizing for images
  has_attached_file :avatar, styles: { small: '64x64', med: '100x100', large: '200x200'}, :default_url => "/images/:style/missing.png"
  # Validate content type
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  # Validate filename
  validates_attachment_file_name :avatar, matches: [/png\Z/, /jpe?g\Z/]
end
