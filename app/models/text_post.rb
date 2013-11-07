class TextPost < ActiveRecord::Base
  attr_accessible :content, :title

  has_many :comments, as: :commentable, dependent: :destroy

  validates :content, presence: true
end
