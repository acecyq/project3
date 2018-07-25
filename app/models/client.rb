class Client < ApplicationRecord

	has_many :case
	belongs_to :user
end
