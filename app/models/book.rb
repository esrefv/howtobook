class Book < ApplicationRecord
  belongs_to :category
  belongs_to :author
  belongs_to :publisher
  belongs_to :interpreter
  has_many :bcomments
  has_many :wishlists
  has_many :wishters, through: :wishlists, source: :user
end
