class Movie < ApplicationRecord
  validates :title, uniqueness: true, presence: true
  validates :overview, presence: true
  has_many :bookmarks


end

# title is unique (FAILED - 6)
#   title cannot be blank (FAILED - 7)
#   overview cannot be blank (FAILED - 8)
#   has many bookmarks (FAILED - 9)
#   should not be able to destroy self if has bookmarks children (FAILED - 10)
