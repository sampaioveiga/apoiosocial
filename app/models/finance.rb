class Finance < ActiveRecord::Base
	belongs_to :patient
	belongs_to :pension
	belongs_to :otherincome
end
