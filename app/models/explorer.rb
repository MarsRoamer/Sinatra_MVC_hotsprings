class Explorer < ActiveRecord::Base

	has_secure_password

	has_many :hotsprings
	has_many :comments

	# has_many :comments
	# has_many :hotsprings
	# has_many :hotsprings, through: :comments
	# # has_many :owned_hotsprings, class_name: "Hotspring"

  def slug
    username.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    User.all.find{|user| user.slug == slug}
  end


end