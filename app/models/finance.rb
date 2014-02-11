class Finance < ActiveRecord::Base
	belongs_to	:patient
	belongs_to	:pension
end
