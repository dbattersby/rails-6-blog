class Category < ApplicationRecord
  validates_presence_of :title, :url
  has_many :posts

end
