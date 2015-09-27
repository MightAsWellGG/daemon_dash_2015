class Student < ActiveRecord::Base
attr_accessible :email, :name, :password, :listing_ids
  listing_ids = Array.new

  validates :password, :presence => true
  validates :password, :length => { :in => 5..200}
  validates :name, :email, :presence => true
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :format => { :with => /@/, :message => " is invalid" }
  validates :email, :format => { :with => /umd/, :message => " must be a UMD email" }

  def password
    p_hash ? @password ||= BCrypt::Password.new(p_hash) : nil
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.p_hash = @password
  end

  def add_listing(email, listing)
    @student = Student.find_by_email(email)
    @listing = Listing.find_by_email(email)
    if @student.email == @listing.user_email
      @listing_ids << @listing.id
    else
      nil
    end
  end

  def self.authenticate(email, test_password)
  	student = Student.find_by_email(email)
  	if student && student.password == test_password
   	 student
	else
      nil
	end
  end


end
