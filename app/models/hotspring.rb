class Hotspring < ActiveRecord::Base
	belongs_to :explorer
	has_many :comments
	# has_many :explorers, through: :comments
	# # belongs_to :explorer
	# belongs_to :owner, class_name: "Explorer", foreign_key: "owner_id"


  def slug
    name.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    Hotspring.all.find{|hotspring| hotspring.slug == slug}
  end

end