class User < ActiveRecord::Base
  belongs_to :profile_page
  has_many :educations
  has_many :experiences
  has_many :followings
  has_many :languages
  has_one :summary
  has_many :projects
  has_many :networks
  has_many :skills_and_endorsements
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable
  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable

end
