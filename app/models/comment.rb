class Comment < ApplicationRecord
  validates_presence_of :author_name, :body
  belongs_to :post
end