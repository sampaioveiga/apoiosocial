class Note < ActiveRecord::Base
	belongs_to :episode
	belongs_to :user

	validates :data,
		presence: { message: "não pode estar em branco" }
end
