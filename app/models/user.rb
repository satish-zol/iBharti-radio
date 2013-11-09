class User < ActiveRecord::Base
  rolify
  belongs_to :college
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :token_authenticatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :role_ids, :authentication_token, 
                  :confirmed_at
  # attr_accessible :title, :body
	before_save :ensure_authentication_token
end
