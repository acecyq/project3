class Lawyer < ApplicationRecord
	belongs_to :user
	has_and_belongs_to_many :specializations
	mount_uploader :photo, PhotoUploader
end
