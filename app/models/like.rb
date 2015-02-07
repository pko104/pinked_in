class Like < ActiveRecord::Base
  belongs_to :message
  has_many :users
end
