class Habitation < ActiveRecord::Base
	belongs_to :patient
	belongs_to :habitationtype
	belongs_to :habitationoccupation
end
