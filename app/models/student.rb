class Student < ActiveRecord::Base
	attr_accessible :name, :email, :password

	validates :pw, :presence => true
	validates :pw, :length => { :in => 6..25}
	validates :name, :email, :presence => true
	validates :email, :uniqueness => { :case_sensitive => false}
	validates :email, :format => { :with => /@/, :message => " is invalid, please put in valid email with @ symbol!"}
	validates :email, :format => { :with => "umd.edu", :message => " is invalid, need a UMD domain (umd.edu)"}

	def password
		password ? @pw ||= BCrypt::Password.new(password) : nil
	end

	def password=(new_password)
		@password = BCrypt::Password.create(new_password)
		self.password = @pw
	end

end
