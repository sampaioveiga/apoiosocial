class Note < ActiveRecord::Base
	belongs_to :episode
	belongs_to :user
end
