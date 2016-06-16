class Article < ActiveRecord::Base
  has_many :comments
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