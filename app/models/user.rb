class User < ActiveRecord::Base
	rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  validates :name, :presence => true,
                    :length => {:maximum => 30}

  has_many :articles


  def role?(role)
    roles.include? role.to_s
  end

  def to_param
    "#{id}-#{name.gsub(/\W/, '-').downcase}s-articles"
  end

end
