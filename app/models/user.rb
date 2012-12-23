class User < ActiveRecord::Base
  rolify

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable

  attr_accessible :email, :password, :password_confirmation, :remember_me,
    :avatar_url, :bio, :email, :screen_name
  
  has_many :bleats  
  has_many :authorizations, :dependent => :destroy
  
  validates :screen_name, :uniqueness => true, :presence => true
  validates :email, :presence => true, :uniqueness => true
  
  before_save :default_values

  def default_values
    self.avatar_url ||= 'default_user.png'
  end
  
  def admin?
    self.has_role? :admin or self.has_role? :moderator
  end
  
  scope :active, where('last_sign_in_at > ?', Date.today - 30)
end
