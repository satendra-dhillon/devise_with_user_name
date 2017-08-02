class Blog < ApplicationRecord
	has_many :comments, as: :commentable, dependent: :destroy
	belongs_to :category
	belongs_to :blogger, class_name: 'User', foreign_key: 'blogger_id'

end
