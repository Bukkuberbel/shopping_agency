class User < ApplicationRecord
  mount_uploader :picture, PictureUploader

  has_secure_password
  has_many :requests
  has_many :products
end
