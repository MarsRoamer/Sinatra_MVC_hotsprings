class Explorer < ActiveRecord::Base

	has_secure_password

	has_many :hotsprings
	has_many :comments

	# has_many :comments
	# has_many :hotsprings
	# has_many :hotsprings, through: :comments
	# # has_many :owned_hotsprings, class_name: "Hotspring"


end