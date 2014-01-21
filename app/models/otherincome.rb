class Otherincome < ActiveRecord::Base
	has_many :finances, dependent: :nullify
end
