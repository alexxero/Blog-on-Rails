class Comment < ActiveRecord::Base
  belongs_to :article
  belongs_to :user

  validates :body, length: { maximum: 4000 }
end
