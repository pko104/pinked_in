class Network < ActiveRecord::Base
  has_many :users
  has_many :messages, through: :users
end
