class User < ActiveRecord::Base
  has_many :responses
  has_many :questioninstances, through: :responses
end
