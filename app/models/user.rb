class User < ApplicationRecord

  validates :user_id, {presence: true, uniqueness: true}
  validates :name, {presence: true}
  validates :shop_cord, {presence: true}
  validates :password, {presence: true}
  validates :month, {presence: true}
  validates :day, {presence: true}
  validates :start, {presence: true}
  validates :end, {presence: true}
  
end
