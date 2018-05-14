class Hotspring < ActiveRecord::Base
	belongs_to :explorer
	has_many :comments
	# has_many :explorers, through: :comments
	# # belongs_to :explorer
	# belongs_to :owner, class_name: "Explorer", foreign_key: "owner_id"

end