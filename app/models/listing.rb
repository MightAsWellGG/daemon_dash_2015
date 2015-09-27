class Listing < ActiveRecord::Base
	attr_accessible :title, :isbn, :condition, :price, :seller_email, :comments, :course_name

	validates :title, :isbn, :condition, :price, :seller_email, :course_name, :presence => true
	validates :course_name, :length => { :in => 7..8, :message => " please format course name with 
		4 letters of department name followed by 3 numbers, possibly with a letter at the end
		 (ex: CMSC216, MATH141, HONR228E)." }

	require 'net/http'
	url = 'http://daemondash.bookholders.com/classdata/umcp/'
	begin
		resp = Net::HTTP.get_response(URI.parse(url + course_name[0..3] + "/" + course_name))
	rescue
		print "Connection error."
	end
	resp_text = resp.body

	validates :resp_text["nodata"], exclusion: { in: "yes", :message => " is not a valid course name or format. 
		Correct format is 4 letters of department name followed by 3 numbers, possibly with a letter at the end
		 (ex: CMSC216, MATH141, HONR228E)." }

end
