class Listing < ActiveRecord::Base
	attr_accessible :title, :isbn, :condition, :price, :user_email, :comments, :course_name
	validates :title, :isbn, :condition, :price, :user_email, :comments, :course_name, :presence => true
end
