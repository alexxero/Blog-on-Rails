class Article < ActiveRecord::Base
  acts_as_votable
  has_many :comments
  has_one :user
  validates :title, presence: true
  validates :title, length: { maximum: 140 }
  validates :text, presence: true
  validates :text, length: { maximum: 4000 }

  def subject
    title
  end

  def last_comment
    comments.last
  end

end