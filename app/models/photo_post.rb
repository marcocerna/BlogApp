class PhotoPost < ActiveRecord::Base
  attr_accessible :title, :url

  has_many :comments, as: :commentable, dependent: :destroy

  validates :url, presence: true
end
