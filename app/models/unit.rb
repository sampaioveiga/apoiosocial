class Unit < ActiveRecord::Base
	has_many :episodes, dependent: :nullify

	validates :nome,
		presence: { message: "não pode estar em branco" }
end
