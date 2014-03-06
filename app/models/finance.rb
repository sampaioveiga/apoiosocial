class Finance < ActiveRecord::Base
	belongs_to	:patient
	belongs_to	:pension

	validates :pension_id,
		presence: true
end
