class User < ActiveRecord::Base
  belongs_to :profile_page
  has_many :educations
  has_many :experiences
  has_many :followings
  has_many :languages
  has_one :summary
  has_many :projects
  has_many :networks
  has_many :skills
  has_many :messages
  belongs_to :like

  mount_uploader :avatar, AvatarUploader
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
