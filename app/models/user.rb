class User < ActiveRecord::Base
  attr_accessible :name, :email

  # Each user can own many jobs
  has_many :jobs, :dependent => :destroy

  # Validate that name, description, and url are set
  validates_presence_of :name, :email
  validates_uniqueness_of :email

  protected

  def self.authenticate(email)
    @user = User.find_by_email(email)
    return @user unless @user.nil?
    return false
  end

end
