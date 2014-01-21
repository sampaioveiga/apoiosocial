class Pension < ActiveRecord::Base
	has_many :finances, dependent: :nullify
end
