class Socialfamily < ActiveRecord::Base
	belongs_to	:patient
	belongs_to	:socialfamilyhelp
end
