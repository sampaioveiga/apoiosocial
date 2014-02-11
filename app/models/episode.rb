class Episode < ActiveRecord::Base
	belongs_to	:patient
	belongs_to	:unit
	belongs_to	:service
	belongs_to	:intervention
	belongs_to	:program
	belongs_to	:user

	validates :data,
		presence: { message: "não pode estar vazio" }
end
