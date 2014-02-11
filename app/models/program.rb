class Program < ActiveRecord::Base
	has_many :episodes, dependent: :nullify
end
