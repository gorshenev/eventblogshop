class Product < ActiveRecord::Base
	has_attached_file :photo, :styles => { :large => "600x600>", :medium => "250x250>", :thumb => "100x100>" }
	validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
	acts_as_sellable
end