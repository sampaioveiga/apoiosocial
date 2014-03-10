class Finance < ActiveRecord::Base
	belongs_to	:patient
	belongs_to	:pension

	validates :pension_id,
		presence: { message: "não pode estar em branco" }
end
