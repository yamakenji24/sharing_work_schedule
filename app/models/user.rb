class User < ApplicationRecord

  validates :user_id, {presence: true, uniqueness: true}
  validates :name, {presence: true}
  validates :shop_cord, {presence: true}
  validates :password, {presence: true}
  
end
